class CreateExerciseMuscleGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :exercise_muscle_groups do |t|
      t.references :training_exercise, null: false, foreign_key: true, index: false
      t.references :muscle_group, null: false, foreign_key: true
      t.index %i[training_exercise_id muscle_group_id], unique: true

      t.timestamps
    end
  end
end
