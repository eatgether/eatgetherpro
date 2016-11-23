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

#  is_hidden   :boolean          default(FALSE)


class Post < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :order
  has_many :asker_requests
  has_many :asker_users, through: :asker_requests,source: :user
  scope :all_except, -> (post){where.not(id: post)}
  scope :recent, -> {order("created_at DESC")}

  def self.no_match
    where('id NOT IN (SELECT DISTINCT poster_id FROM orders)
       AND id NOT IN (SELECT DISTINCT asker_id FROM orders)')
  end

   validates_presence_of :title, :message => "为了能约到饭，请如实填写"
   validates_presence_of :description, :message => "写一点自我介绍吧"

    def must_be_weekend
      if !eat_day.saturday? || eat_day.sunday?
        errors.add(:base,  message:'Must be weeknd')

      end
    end

    def self.default_location
      ["101咖啡", "汤城小厨", "星巴克", "USA"]
    end



end
