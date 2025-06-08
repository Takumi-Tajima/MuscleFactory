class WorkoutScheduleExercise < ApplicationRecord
  belongs_to :workout_schedule
  belongs_to :training_exercise
  has_many :exercise_sets, dependent: :destroy

  scope :default_order, -> { order(id: :desc) }
end
