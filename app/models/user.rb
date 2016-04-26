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

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email,
            uniqueness_without_deleted: true,
            email_format: true

  validates :password,
            length: { minimum: 8 },
            confirmation: true,
            if: :new_record_or_changes_password

  validates :password_confirmation,
            presence: true,
            if: :new_record_or_changes_password

  private

  def new_record_or_changes_password
    new_record? || changes[:crypted_password]
  end
end
