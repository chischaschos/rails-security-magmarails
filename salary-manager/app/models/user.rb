class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_one :salary
  has_many :raises
  belongs_to :role

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id, :salary_attributes, :role, :salary, :site

  accepts_nested_attributes_for :salary

  validates_presence_of :email, :password, :role
  #validates_format_of :site, :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix

end
