class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id, :salary_attributes, :role, :salary
  has_one :salary
  accepts_nested_attributes_for :salary
  belongs_to :role
  validates_presence_of :email, :password, :role
end
