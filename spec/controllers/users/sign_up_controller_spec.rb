require 'rails_helper'

RSpec.describe Users::SignUpController, type: :request do
  describe 'POST /users/sign_up' do
    let(:user_attributes) { build(:user) }
    let(:params) {{
      user: {
        name: user_attributes.name,
        email: user_attributes.email,
        password: user_attributes.password,
        password_confirmation: user_attributes.password_confirmation
      }
    }}

    it 'create user' do
      is_expected.to eq 302
      expect(response.header['Location']).to eq root_url
      user = User.last
      expect(user.email).to eq user_attributes.email
    end

    context '不正なparams' do
      let(:params) {{
        user: {
          name: user_attributes.name,
          email: user_attributes.email,
        }
      }}

      it 'create user' do
        is_expected.to eq 422
      end
    end
  end
end
