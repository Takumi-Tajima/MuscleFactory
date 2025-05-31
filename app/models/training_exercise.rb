class TrainingExercise < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  scope :default_order, -> { order(id: :desc) }
end
