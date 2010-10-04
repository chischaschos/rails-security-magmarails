class Raise < ActiveRecord::Base
  belongs_to :user
  belongs_to :approver, :class_name => 'User'
  validates_presence_of :request_amount
end

