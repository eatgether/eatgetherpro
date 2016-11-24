# == Schema Information
#
# Table name: order_twos
#
#  id             :integer          not null, primary key
#  post_id        :integer
#  poster_user_id :integer
#  asker_user_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  aasm_state     :string           default("order_matched")
#

class OrderTwo < ApplicationRecord
  include AASM

  belongs_to :poster_user, :class_name => "User"
  belongs_to :asker_user, :class_name => "User"
  belongs_to :post, :class_name => "Post"
  has_many :feedbacks
  has_many :notifications, as: :notifiable

  scope :recent, -> {order("updated_at DESC")}
  
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

end
