class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def name
  	return "#{first_name} #{last_name}"
  end
  
  has_many :organized_events, foreign_key: 'admin_id', class_name: "Event", dependent: :destroy
  has_many :attendances, foreign_key: 'participant_id', dependent: :destroy
  has_many :events, through: :attendances
end
