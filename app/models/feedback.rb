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
#  rating       :integer
#

class Feedback < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :order_two

	scope :recent, -> {order("created_at DESC")}
	scope :publish, -> { where(:is_hidden => false)}

	def self.search(search)
	 where("title LIKE ?", "%#{search}%").or(where("description LIKE ?", "%#{search}%"))
	end

	def publish!
		self.is_hidden = false
		self.save
	end

	def hide!
		self.is_hidden = true
		self.save
	end

end
