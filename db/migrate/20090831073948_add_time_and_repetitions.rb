class AddTimeAndRepetitions < ActiveRecord::Migration
  def self.up
    add_column :sequence_exercises, :repetitions, :integer
    add_column :sequence_exercises, :time, :time  
  end

  def self.down
    remove_column :sequence_exercises, :time
    remove_column :sequence_exercises, :repetitions
  end
end
