require 'test_helper'

class SubcontractorsControllerTest < ActionController::TestCase
  setup do
    @subcontractor = subcontractors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcontractors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcontractor" do
    assert_difference('Subcontractor.count') do
      post :create, subcontractor: { city: @subcontractor.city, email: @subcontractor.email, name: @subcontractor.name, phone: @subcontractor.phone, state: @subcontractor.state, street: @subcontractor.street, website: @subcontractor.website, zip: @subcontractor.zip }
    end

    assert_redirected_to subcontractor_path(assigns(:subcontractor))
  end

  test "should show subcontractor" do
    get :show, id: @subcontractor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcontractor
    assert_response :success
  end

  test "should update subcontractor" do
    patch :update, id: @subcontractor, subcontractor: { city: @subcontractor.city, email: @subcontractor.email, name: @subcontractor.name, phone: @subcontractor.phone, state: @subcontractor.state, street: @subcontractor.street, website: @subcontractor.website, zip: @subcontractor.zip }
    assert_redirected_to subcontractor_path(assigns(:subcontractor))
  end

  test "should destroy subcontractor" do
    assert_difference('Subcontractor.count', -1) do
      delete :destroy, id: @subcontractor
    end

    assert_redirected_to subcontractors_path
  end
end
