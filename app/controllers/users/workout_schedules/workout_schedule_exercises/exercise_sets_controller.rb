class Users::WorkoutSchedules::WorkoutScheduleExercises::ExerciseSetsController < ApplicationController
  before_action :set_workout_schedule, only: %i[new create edit update destroy]
  before_action :set_workout_schedule_exercise, only: %i[new create edit update destroy]

  def new
    @exercise_set = @workout_schedule_exercise.exercise_sets.build
  end

  def create
    @exercise_set = @workout_schedule_exercise.exercise_sets.build(exercise_set_params)

    if @exercise_set.save
      redirect_to users_workout_schedule_workout_schedule_exercise_path(@workout_schedule, @workout_schedule_exercise),
                  notice: 'Exercise set was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_workout_schedule
    @workout_schedule = current_user.workout_schedules.find(params.expect(:workout_schedule_id))
  end

  def set_workout_schedule_exercise
    @workout_schedule_exercise = @workout_schedule.workout_schedule_exercises.find(params.expect(:workout_schedule_exercise_id))
  end

  def exercise_set_params
    params.expect(exercise_set: %i[reps weight_kg memo completed workout_schedule_exercise_id])
  end
end
