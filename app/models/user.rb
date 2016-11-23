# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  nameChi                :string
#  nameNick               :string
#  image                  :string
#  gender                 :string
#  birthday               :date
#  cellNum                :integer
#  income                 :integer
#  heightUser             :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_messageable

  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end
has_many :conversations
 #  def mailboxer_name
 #   self.name
 # end
 #
 # def mailboxer_email(object)
 #   self.email
 # end
 #
 #  def send_message(recipients, msg_body, subject, resource, sanitize_text = true, attachment = nil, message_timestamp = Time.now)
 #    conversation = Mailboxer::ConversationBuilder.new(subject: subject,
 #                                               created_at: message_timestamp,
 #                                               updated_at: message_timestamp).build
 #
 #    message = Mailboxer::MessageBuilder.new(sender: self,
 #                                            conversation: conversation,
 #                                            recipients: recipients,
 #                                            body: msg_body,
 #                                            subject: subject,
 #                                            attachment: attachment,
 #                                            created_at: message_timestamp,
 #                                            updated_at: message_timestamp).build
 #
 #    conversation.update_attribute(:conversationable_id, resource.id)
 #    conversation.update_attribute(:conversationable_type, resource.class)
 #    conversation.save
 #    message.deliver false, sanitize_text
 #  end



















  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :posts
	has_many :feedbacks
  has_many :asker_requests
  has_many :ask_posts, :through => :asker_requests, :source => :post
  has_many :user_interests
  has_many :interest, :through => :user_interests,source: :interest

  mount_uploader :image, ImageUploader
  scope :all_except, -> (user) {where.not(id: user)}


  scope :recent, -> {order("created_at DESC")}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_asker_of?(post)
    ask_posts.include?(post)
  end

  def application!(post)
    ask_posts << post
  end

  def cancel_application!(post)
    ask_posts.delete(post)
  end

  def admin?
     is_admin
  end

  def take_master!
    self.is_admin = true
    self.save
  end

  def customer!
    self.is_admin = false
    self.save
  end
end
