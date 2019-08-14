class Attendance < ApplicationRecord
  after_create :new_participant_send

  def new_participant_send
    UserMailer.new_participant_email(self).deliver_now
  end

  belongs_to :participant, class_name: "User"
  belongs_to :event
end
