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
#  eatVenue    :string
#  eatDay      :date
#

<<<<<<< HEAD
#  eatVenue    :string
#  eatDay      :date
=======
#  is_hidden   :boolean          default(FALSE)
>>>>>>> d0e389f84355fc06d2d04980bd3dd05ea6e8fcb7
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
