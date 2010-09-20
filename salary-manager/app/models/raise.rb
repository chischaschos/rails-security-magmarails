class Raise < ActiveRecord::Base
  belongs_to :user
  belongs_to :approver, :class_name => 'User'
end

