class TrainingExercise < ApplicationRecord
  has_many :exercise_muscle_groups, dependent: :destroy
  has_many :muscle_groups, through: :exercise_muscle_groups
  has_many :exercise_taggings, dependent: :destroy
  has_many :exercise_tags, through: :exercise_taggings

  attr_accessor :muscle_group_names, :exercise_tag_names

  before_save :save_assigned_muscle_groups
  before_save :save_assigned_tags

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

  def save_assigned_tags
    return if exercise_tag_names.blank?

    new_tag_names = exercise_tag_names.split(/[[:blank:]]*,[[:blank:]]*/)
                                      .map(&:downcase)
                                      .uniq
                                      .compact_blank

    self.exercise_tags = new_tag_names.map { |name| ExerciseTag.find_or_create_by(name: name) }
  end
end
