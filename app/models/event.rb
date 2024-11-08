class Event < ApplicationRecord
  validates :date, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 3, maximum: 250 }
  validate :date_is_not_past

  private
  def date_is_not_past
    if date.present? && date < Date.today
      errors.add(:date, "cannot be in the past")
    end
  end
end
