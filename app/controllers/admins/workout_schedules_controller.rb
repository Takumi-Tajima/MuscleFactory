class Admins::WorkoutSchedulesController < Admins::ApplicationController
  before_action :set_workout_schedule, only: %i[show edit update destroy]

  def index
    @workout_schedules = WorkoutSchedule.preload(:user).default_order
  end

  def show
  end

  def edit
  end

  def update
    if @workout_schedule.update(workout_schedule_params)
      redirect_to admins_workout_schedule_path(@workout_schedule), notice: 'スケジュールを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout_schedule.destroy!
    redirect_to admins_workout_schedules_path, notice: 'スケジュールを削除しました', status: :see_other
  end

  private

  def set_workout_schedule
    @workout_schedule = WorkoutSchedule.find(params.expect(:id))
  end

  def workout_schedule_params
    params.expect(workout_schedule: %w[scheduled_on user_id])
  end
end
