# == Schema Information
#
# Table name: feedbacks
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  image        :string
#  user_id      :integer
#  order_two_id :integer
#

class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :order_two
end
