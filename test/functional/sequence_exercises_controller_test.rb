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
end