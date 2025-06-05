class WorkoutSchedule < ApplicationRecord
  belongs_to :user
  has_many :workout_schedule_exercises, dependent: :destroy

  scope :default_order, -> { order(id: :desc) }
end
