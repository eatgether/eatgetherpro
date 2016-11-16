class Order < ApplicationRecord
	include AASM
	belongs_to :asker, :class_name => "Post"
  belongs_to :poster, :class_name => "Post"
  belongs_to :poster_user, :class_name => "User"
  belongs_to :asker_user, :class_name => "User"
	has_many :feedbacks

	aasm do
		state :order_matched, initial: true
		state :order_met
		state :order_cancelled

		event :metMatch do
			transitions from: :order_matched, to: :order_met
		end

		event :cancel_order do
			transitions from: :order_matched, to: :order_cancelled
		end

		event :revive_order do
			transitions from: [:order_cancelled, :order_met], to: :order_matched
		end
	end

scope :account_order, ->(post) { where(poster_id) }

end
