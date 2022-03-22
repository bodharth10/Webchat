class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Validations
  validates :username, uniqueness: true, presence: true


  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end


  def calculate_total_no_of_msgs_since_last_week
    no_of_messages = RoomMessage.where('created_at >= ?', 1.week.ago).count rescue 0
  end

  def total_no_of_message_since_last_message
    begin
      last_message_sent_at = RoomMessage.where(user_id: self.id).last.created_at
      no_of_messages = RoomMessage.where.not(user_id: self.id).where('created_at >= ?', last_message_sent_at).count
    rescue StandardError => e
      0
    end
  end
end
