class CreateMuscleGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :muscle_groups do |t|
      t.string :name, null: false
      t.index :name, unique: true

      t.timestamps
    end
  end
end
