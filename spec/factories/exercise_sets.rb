FactoryBot.define do
  factory :exercise_set do
    workout_schedule_exercise { nil }
    reps { 1 }
    weight_kg { 1.5 }
    memo { "MyString" }
    completed { false }
  end
end
