class AddOrderToSequenceExercises < ActiveRecord::Migration
  def self.up
    add_column :sequence_exercises, :exercise_order, :integer
  end

  def self.down
    remove_column :sequence_exercises, :exercise_order
  end
end
