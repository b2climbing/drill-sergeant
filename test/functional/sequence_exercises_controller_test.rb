require File.dirname(__FILE__) + '/../test_helper'

class SequenceExercisesControllerTest < ActionController::TestCase
  context "when ordering exercises" do
    setup do 
      3.times{ Factory(:sequence_exercise) }
    end

    should "update the order attribute by xhr" do
      ids = SequenceExercise.all.collect(&:id).reverse
      xhr(:post, :order, {:exercises => ids})
      assert_equal ids, SequenceExercise.all(:order => 'exercise_order ASC').collect(&:id)
      assert_template ''
    end

    should "update the order attribute" do
      ids = SequenceExercise.all.collect(&:id).reverse
      post :order, {:exercises => ids, :redirect => {:controller => 'exercise', :action => 'edit'} }
      assert_equal ids, SequenceExercise.all(:order => 'exercise_order ASC').collect(&:id)
      assert_redirected_to :controller => :exercise, :action => :edit
    end
  end

  context 'when updating the sequence exercise' do
    setup{ @sequence_exercise = Factory(:sequence_exercise) }

    should 'save time as integer' do
      put :update, :id => @sequence_exercise.id, :sequence_exercise =>{"time(1i)"=>"1", "time(2i)"=>"2", "time(3i)"=>"3", "time(4i)"=>"01", "time(5i)"=>"02", "time(6i)"=>"03"}
      assert_equal 1.hour + 2.minutes + 3.seconds, @sequence_exercise.reload.time
    end
  end
end