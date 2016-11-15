# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  asker_id       :integer
#  poster_id      :integer
#  poster_user_id :integer
#  asker_user_id  :integer
#  aasm_state     :string           default("order_matched")
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
