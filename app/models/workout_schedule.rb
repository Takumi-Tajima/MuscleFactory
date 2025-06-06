class WorkoutSchedule < ApplicationRecord
  belongs_to :user
  has_many :workout_schedule_exercises, dependent: :destroy
  has_many :training_exercises, through: :workout_schedule_exercises

  scope :default_order, -> { order(id: :desc) }
end
