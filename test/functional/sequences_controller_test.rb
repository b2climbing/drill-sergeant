require File.dirname(__FILE__) + '/../test_helper'

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
end