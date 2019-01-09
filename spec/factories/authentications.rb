# == Schema Information
#
# Table name: authentications
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  provider   :string(255)
#  uid        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authentications_on_provider_and_uid  (provider,uid)
#

FactoryBot.define do
  factory :authentication do
    
  end
end
