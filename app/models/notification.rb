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

class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :recipient, :class_name => "User"
  belongs_to :trigger, :class_name => "User"
end
