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

  def self.no_match
    where('id NOT IN (SELECT DISTINCT poster_id FROM orders)
       AND id NOT IN (SELECT DISTINCT asker_id FROM orders)')
  end
  # validates :title, presence: true

  # validates :description, presence: true
  #
   validates_presence_of :title, :message => "为了能约到饭，请如实填写"
   validates_presence_of :description, :message => "写一点自我介绍吧"
   validates_inclusion_of :eat_venue, :in => ['101咖啡', '汤城小厨', '星巴克', 'USA'],
    :message => "地点只能在'101咖啡','汤城小厨','星巴克','USA'中选择"

    validates_presence_of :image, :message => "想约饭，图片一定要上"

    validate :must_be_weekend

    def must_be_weekend
      if !eat_day.saturday? || eat_day.sunday?
        errors.add(:base,  message:'Must be weeknd')

      end
    end

    # validates_inclusion_of :eat_day, :in => Date.civil(2016, 11, 15) .. Date.today,:message => "日期必须是2016年11月1日到今天之间"



end
