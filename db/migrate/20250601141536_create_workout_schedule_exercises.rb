class CreateWorkoutScheduleExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_schedule_exercises do |t|
      t.references :workout_schedule, null: false, foreign_key: true, index: false
      t.references :training_exercise, null: false, foreign_key: true

      t.timestamps
      t.index %i[workout_schedule_id training_exercise_id], unique: true
    end
  end
end
