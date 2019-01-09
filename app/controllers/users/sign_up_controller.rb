class Users::SignUpController < ApplicationController
  skip_before_action :require_login
  before_action -> { redirect_to :back if logged_in? }

  def show
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    return render :show, status: :unprocessable_entity if @user.errors.present?

    auto_login(@user)

    redirect_to root_url, notice: 'ユーザー登録が完了しました'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
