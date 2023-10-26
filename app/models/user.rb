class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :executions, dependent: :destroy

  accepts_nested_attributes_for :roles, allow_destroy: true

  validates :nickname, presence: true, uniqueness: true
end
