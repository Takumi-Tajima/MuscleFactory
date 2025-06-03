class WorkoutSchedule < ApplicationRecord
  belongs_to :user
  has_many :workout_schedule_exercises, dependent: :destroy
end
