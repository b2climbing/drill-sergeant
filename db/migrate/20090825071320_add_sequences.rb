class AddSequences < ActiveRecord::Migration
  def self.up
    create_table :sequences, :force => true do |t|
      t.string :name, :url
      t.text :description
      t.integer :time_between_exercises
      t.timestamps
    end
    
    create_table :exercises_sequences, :force => true do |t|
      t.integer :sequence_id
      t.integer :exercise_id
    end
  end

  def self.down
    drop_table :sequence_exercieses
    drop_table :sequences
  end
end
