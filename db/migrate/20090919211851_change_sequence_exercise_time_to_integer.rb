class ChangeSequenceExerciseTimeToInteger < ActiveRecord::Migration
  def self.up
    change_column :sequence_exercises, :time, :integer
  end

  def self.down
    change_column :sequence_exercises, :time, :time
  end
end
