# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  email            :string(255)      not null
#  crypted_password :string(255)
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#  index_users_on_email       (email)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
