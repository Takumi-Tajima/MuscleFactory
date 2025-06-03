class CreateWorkoutSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_schedules do |t|
      t.datetime :scheduled_on, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
