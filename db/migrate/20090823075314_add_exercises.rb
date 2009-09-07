class AddExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises, :force => true do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :excercises
  end
end
