class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :order_two
end
