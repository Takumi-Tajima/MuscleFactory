class CreateExerciseTaggings < ActiveRecord::Migration[8.0]
  def change
    create_table :exercise_taggings do |t|
      t.references :training_exercise, null: false, foreign_key: true, index: false
      t.references :exercise_tag, null: false, foreign_key: true
      t.index %i[training_exercise_id exercise_tag_id], unique: true

      t.timestamps
    end
  end
end
