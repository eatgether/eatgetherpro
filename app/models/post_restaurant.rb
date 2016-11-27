# == Schema Information
#
# Table name: post_restaurants
#
#  id            :integer          not null, primary key
#  post_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PostRestaurant < ApplicationRecord
  belongs_to :restaurant
  belongs_to :post
end
