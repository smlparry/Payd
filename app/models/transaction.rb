class Transaction < ActiveRecord::Base
  belongs_to :plan
  belongs_to :user
end
