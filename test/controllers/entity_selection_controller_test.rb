require 'test_helper'

class EntitySelectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get entity_selection_index_url
    assert_response :success
  end

end
