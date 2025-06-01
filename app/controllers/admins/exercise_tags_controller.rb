class Admins::ExerciseTagsController < Admins::ApplicationController
  before_action :set_exercise_tag, only: %i[show edit update destroy]

  def index
    @exercise_tags = ExerciseTag.default_order
  end

  def show
  end

  def new
    @exercise_tag = ExerciseTag.new
  end

  def edit
  end

  def create
    @exercise_tag = ExerciseTag.new(exercise_tag_params)

    if @exercise_tag.save
      redirect_to admins_exercise_tag_path(@exercise_tag), notice: 'タグを作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @exercise_tag.update(exercise_tag_params)
      redirect_to admins_exercise_tag_path(@exercise_tag), notice: 'タグを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise_tag.destroy!
    redirect_to admins_exercise_tags_path, notice: 'タグを削除しました', status: :see_other
  end

  private

  def set_exercise_tag
    @exercise_tag = ExerciseTag.find(params.expect(:id))
  end

  def exercise_tag_params
    params.expect(exercise_tag: %w[name])
  end
end
