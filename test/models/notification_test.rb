# == Schema Information
#
# Table name: notifications
#
#  id              :integer          not null, primary key
#  name            :string
#  notifiable_id   :integer
#  notifiable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  read_at         :datetime
#  recipient_id    :integer
#  trigger_id      :integer
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
