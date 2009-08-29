class RenameExercisesSequences < ActiveRecord::Migration
  def self.up
    rename_table :exercises_sequences, :sequence_exercises
  end

  def self.down
    rename_table :sequence_exercises, :exercises_sequences
  end
end
