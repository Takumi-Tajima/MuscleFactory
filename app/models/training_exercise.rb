class TrainingExercise < ApplicationRecord
  has_many :exercise_muscle_groups, dependent: :destroy
  has_many :muscle_groups, through: :exercise_muscle_groups

  attr_accessor :muscle_group_names

  before_save :save_assigned_muscle_groups

  validates :name, presence: true
  validates :description, presence: true

  scope :default_order, -> { order(id: :desc) }

  private

  def save_assigned_muscle_groups
    return if muscle_group_names.blank?

    new_muscle_group_names = muscle_group_names.split(/[[:blank:]]*,[[:blank:]]*/)
                                               .map(&:downcase)
                                               .uniq
                                               .compact_blank

    self.muscle_groups = new_muscle_group_names.map { |name| MuscleGroup.find_or_create_by(name: name) }
  end
end
