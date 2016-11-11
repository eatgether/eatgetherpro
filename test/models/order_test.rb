# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  post_1_id  :integer
#  post_2_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  asker_id   :integer
#  poster_id  :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
