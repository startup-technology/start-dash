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

class User < ApplicationRecord
  authenticates_with_sorcery!
  acts_as_paranoid

  has_many :authentications, dependent: :destroy

  accepts_nested_attributes_for :authentications

  validates :name,
            presence: true,
            length: { maximum: 32 }

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

  def authenticated?(provider)
    authentications.exists?(provider: provider)
  end

  private

  def new_record_or_changes_password
    new_record? || changes[:crypted_password]
  end
end
