class Sequence < ActiveRecord::Base
  has_many :sequence_exercises
  has_many :exercises, :through => :sequence_exercises
end