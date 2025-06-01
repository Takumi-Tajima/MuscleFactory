class ExerciseTagging < ApplicationRecord
  belongs_to :training_exercise
  belongs_to :exercise_tag
end
