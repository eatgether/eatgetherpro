# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  asker_id   :integer
#  poster_id  :integer
#

class Order < ApplicationRecord
  belongs_to :asker, :class_name => "User"
  belongs_to :poster, :class_name => "User"
  
end
