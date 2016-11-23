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
#

class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true

end
