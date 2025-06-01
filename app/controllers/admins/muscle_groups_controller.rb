class Admins::MuscleGroupsController < Admins::ApplicationController
  before_action :set_muscle_group, only: %i[show edit update destroy]

  def index
    @muscle_groups = MuscleGroup.default_order
  end

  def show
  end

  def new
    @muscle_group = MuscleGroup.new
  end

  def edit
  end

  def create
    @muscle_group = MuscleGroup.new(muscle_group_params)

    if @muscle_group.save
      redirect_to admins_muscle_group_path(@muscle_group), notice: '部位を作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @muscle_group.update(muscle_group_params)
      redirect_to admins_muscle_group_path(@muscle_group), notice: '部位を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @muscle_group.destroy!
    redirect_to admins_muscle_groups_path, notice: '部位を削除しました', status: :see_other
  end

  private

  def set_muscle_group
    @muscle_group = MuscleGroup.find(params.expect(:id))
  end

  def muscle_group_params
    params.expect(muscle_group: %w[name])
  end
end
