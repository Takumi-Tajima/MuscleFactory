class ExerciseTag < ApplicationRecord
  has_many :exercise_taggings, dependent: :destroy
  has_many :training_exercises, through: :exercise_taggings

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :default_order, -> { order(id: :desc) }
end
