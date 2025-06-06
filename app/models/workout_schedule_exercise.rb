class WorkoutScheduleExercise < ApplicationRecord
  belongs_to :workout_schedule
  belongs_to :training_exercise

  scope :default_order, -> { order(id: :desc) }
end
