class Subscriber < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  has_many :transactions
end
