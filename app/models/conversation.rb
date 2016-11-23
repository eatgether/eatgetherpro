# == Schema Information
#
# Table name: mailboxer_conversations
#
#  id           :integer          not null, primary key
#  subject      :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_two_id :integer
#

class Conversation < Mailboxer::Conversation
  belongs_to :order_two

  def mailboxer_email
    email
  end
end
