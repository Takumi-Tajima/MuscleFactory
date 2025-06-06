class WorkoutSchedule < ApplicationRecord
  belongs_to :user
  has_many :workout_schedule_exercises, dependent: :destroy
  has_many :training_exercises, through: :workout_schedule_exercises

  accepts_nested_attributes_for :workout_schedule_exercises, allow_destroy: true, reject_if: :all_blank

  scope :default_order, -> { order(id: :desc) }
end
