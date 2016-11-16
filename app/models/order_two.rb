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
#

class OrderTwo < ApplicationRecord
  belongs_to :poster_user, :class_name => "User"
  belongs_to :asker_user, :class_name => "User"
end
