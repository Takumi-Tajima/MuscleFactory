class Users::WorkoutSchedulesController < Users::ApplicationController
  before_action :set_workout_schedule, only: %i[show edit update destroy]

  def index
    @workout_schedules = current_user.workout_schedules
  end

  def show
    @workout_schedule_exercise = @workout_schedule.workout_schedule_exercises.preload(:training_exercise).default_order
  end

  def new
    @workout_schedule = current_user.workout_schedules.build
    @workout_schedule_exercise = @workout_schedule.workout_schedule_exercises.build
  end

  def edit
  end

  def create
    @workout_schedule = current_user.workout_schedules.build(workout_schedule_params)

    if @workout_schedule.save
      redirect_to users_workout_schedule_path(@workout_schedule), notice: 'スケジュールを作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @workout_schedule.update(workout_schedule_params)
      redirect_to users_workout_schedule_path(@workout_schedule), notice: 'スケジュールを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout_schedule.destroy!
    redirect_to users_workout_schedules_path, notice: 'スケジュールを削除しました', status: :see_other
  end

  private

  def set_workout_schedule
    @workout_schedule = current_user.workout_schedules.find(params.expect(:id))
  end

  def workout_schedule_params
    # expectでできなかったので一旦requireで受け取る
    params.require(:workout_schedule).permit(
      :scheduled_on,
      :user_id,
      workout_schedule_exercises_attributes: %i[id training_exercise_id _destroy]
    )
  end
end
