class Task < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "は今日以降の日付にしてください")
    end
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "は今日以降の日付にしてください")
    end
  end
end
