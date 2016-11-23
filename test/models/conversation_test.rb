# == Schema Information
#
# Table name: mailboxer_conversations
#
#  id           :integer          not null, primary key
#  subject      :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_two_id :integer
#

require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
