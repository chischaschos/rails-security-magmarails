class RaiseHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :salary
#  has_one :approver, :through => :user 
end
