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

require 'test_helper'

class OrderTwoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
