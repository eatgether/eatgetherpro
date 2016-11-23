class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :order_two

	scope :recent, -> {order("created_at DESC")}
end
