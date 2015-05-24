class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :subscribers
end
