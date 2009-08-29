class Exercise < ActiveRecord::Base
  has_many :sequence_exercises
  has_many :sequences, :through => :sequence_exercises
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end