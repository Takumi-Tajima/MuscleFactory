class MuscleGroup < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  scope :default_order, -> { order(id: :desc) }
end
