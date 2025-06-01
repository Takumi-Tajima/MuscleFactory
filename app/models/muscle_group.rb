class MuscleGroup < ApplicationRecord
  has_many :exercise_muscle_groups, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :default_order, -> { order(id: :desc) }
end
