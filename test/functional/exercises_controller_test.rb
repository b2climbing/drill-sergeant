require File.dirname(__FILE__) + '/../test_helper'

class ExercisesControllerTest < ActionController::TestCase   
  context "when viewing the index" do
    setup do
      @exercise = Factory(:exercise) 
      get :index
    end
    
    should_not_set_the_flash
    
    should "show all exercises" do
      assert_select "td", @exercise.name
    end
  end
  
  context "when creating a new exercise" do
    setup do
      post :create, :exercise => {:name => '1000 Sit-ups'}
    end
    
    should_set_the_flash_to('Exercise created')
    
    should "create new exercise in database" do
      assert Exercise.find_by_name('1000 Sit-ups')
    end
  end

end