class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0}
  validate :is_multiple_of_5
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true,  in: 1..1000}
  validates :location, presence: true

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
  
  def is_multiple_of_5
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "must be multiple of 5")
    end
  end
  
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances
end
