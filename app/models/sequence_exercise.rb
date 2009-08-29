class SequenceExercise < ActiveRecord::Base
  belongs_to :sequence
  belongs_to :exercise
  named_scope :ordered, :order => "exercise_order asc"
end