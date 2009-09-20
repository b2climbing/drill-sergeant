require File.dirname(__FILE__) + '/../test_helper'

class SequenceExerciseTest < ActiveSupport::TestCase
  context 'when exercise is non duration-based' do
    setup do 
      @sequence_exercise = Factory.build(:sequence_exercise)
      @sequence_exercise.time = nil
      @sequence_exercise.repetitions = nil
    end
    
    should 'duraction should return nil' do
      assert_equal nil, @sequence_exercise.duration
    end 
  end
  
  context 'when duration is a time' do
    setup{@sequence_exercise = Factory.build(:sequence_exercise)}
    should 'convert time to hours, minutes and seconds' do
      [[1, {:seconds => 1}], [10, {:seconds => 10}], [60, {:minutes => 1}], 
      [61, {:seconds => 1, :minutes => 1}], [3600, {:hours => 1}], 
      [3661, {:hours => 1, :minutes => 1, :seconds => 1}]].each do |time, expected|
        @sequence_exercise.time = time
        assert_equal expected, @sequence_exercise.duration
      end
    end
  end
  
end