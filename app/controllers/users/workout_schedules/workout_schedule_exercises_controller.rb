class Users::WorkoutSchedules::WorkoutScheduleExercisesController < Users::ApplicationController
  before_action :set_workout_schedule, only: %i[show]
  before_action :set_workout_schedule_exercise, only: %i[show]
  before_action :set_exercise_sets, only: %i[show]

  def show
  end

  private

  def set_workout_schedule
    @workout_schedule = current_user.workout_schedules.find(params.expect(:workout_schedule_id))
  end

  def set_workout_schedule_exercise
    @workout_schedule_exercise = @workout_schedule.workout_schedule_exercises.find(params.expect(:id))
  end

  def set_exercise_sets
    @exercise_sets = @workout_schedule_exercise.exercise_sets.default_order
  end
end
