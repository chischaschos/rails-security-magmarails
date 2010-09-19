class Salary < ActiveRecord::Base
  belongs_to :user
  has_many :raise_histories
end
