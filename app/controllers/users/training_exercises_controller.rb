class Users::TrainingExercisesController < Users::ApplicationController
  before_action :set_training_exercise, only: %i[show edit update destroy]

  def index
    @training_exercises = TrainingExercise.default_order
  end

  def show
  end

  def new
    @training_exercise = TrainingExercise.new
  end

  def edit
  end

  def create
    @training_exercise = TrainingExercise.new(training_exercise_params)

    if @training_exercise.save
      redirect_to users_training_exercise_path(@training_exercise), notice: '種目を作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @training_exercise.update(training_exercise_params)
      redirect_to users_training_exercise_path(@training_exercise), notice: '種目を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @training_exercise.destroy!
    redirect_to users_training_exercises_path, notice: '種目を削除しました', status: :see_other
  end

  private

  def set_training_exercise
    @training_exercise = TrainingExercise.find(params.expect(:id))
  end

  def training_exercise_params
    params.expect(training_exercise: %w[name description])
  end
end
