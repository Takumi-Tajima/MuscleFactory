FactoryBot.define do
  factory :workout_schedule do
    name { "MyString" }
    scheduled_on { "2025-06-01 23:15:20" }
    user { nil }
  end
end
