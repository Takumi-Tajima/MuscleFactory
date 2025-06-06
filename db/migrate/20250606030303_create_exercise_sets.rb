class CreateExerciseSets < ActiveRecord::Migration[8.0]
  def change
    create_table :exercise_sets do |t|
      t.references :workout_schedule_exercise, null: false, foreign_key: true
      t.integer :reps, null: false
      t.float :weight_kg, null: false
      t.string :memo, null: false, default: ''
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
