# == Schema Information
#
# Table name: asker_requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_matched :boolean          default(FALSE)
#

class AskerRequest < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :notifications, as: :notifiable
end
