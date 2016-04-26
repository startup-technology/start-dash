# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  crypted_password :string(255)
#  deleted_at       :datetime
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#  index_users_on_email       (email)
#

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

end
