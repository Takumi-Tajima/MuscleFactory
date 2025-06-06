class ExerciseSet < ApplicationRecord
  belongs_to :workout_schedule_exercise

  scope :default_order, -> { order(id: :desc) }
end
