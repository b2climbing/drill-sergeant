require File.dirname(__FILE__) + '/../test_helper'
#TODO: Swap for jQuery
class SequencesControllerTest < ActionController::TestCase     
  context "when viewing the index" do
    setup do
      @sequence = Factory(:sequence)
      get :index
    end
    
    should_not_set_the_flash
    
    should "show all sequences" do
      assert_select "td", @sequence.name
    end
  end
  
  context "when creating a new sequence" do
    setup do
      post :create, :sequence => {:name => 'Ironman'}
    end
    
    should_set_the_flash_to('Sequence created')
    
    should "create new sequence in database" do
      assert Sequence.find_by_name('Ironman')
    end
  end
  
  context "when editing an existing sequence" do
    setup do
      @existing = Factory(:sequence, :name => 'Run 100 Miles')
      put :update, :id => @existing.id, :sequence => {:name => 'Ironman'}
    end
    
    should_set_the_flash_to('Sequence updated')
    
    should "edit sequence in database" do
      assert_equal 'Ironman', @existing.reload.name
    end
  end
  
end