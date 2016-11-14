class Post < ApplicationRecord
  belongs_to :user


  scope :all_except, -> (post) {where.not(id: post)}

  # def current_post_2_id
  #     @post_2_id = self.
  # end

end
