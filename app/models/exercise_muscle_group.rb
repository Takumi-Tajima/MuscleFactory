class ExerciseMuscleGroup < ApplicationRecord
  belongs_to :training_exercise
  belongs_to :muscle_group

  validates :training_exercise_id, uniqueness: { scope: :muscle_group_id }
end
