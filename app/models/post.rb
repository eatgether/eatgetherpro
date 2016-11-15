# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  eat_venue   :string
#  eat_day     :date
#  image       :string
#

#  eatVenue    :string
#  eatDay      :date

#  is_hidden   :boolean          default(FALSE)


class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :order


  scope :all_except, -> (post) {where.not(id: post)}

  # def current_post_2_id
  #     @post_2_id = self.
  # end

end
