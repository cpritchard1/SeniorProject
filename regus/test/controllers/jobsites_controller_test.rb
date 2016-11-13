require 'test_helper'

class JobsitesControllerTest < ActionController::TestCase
  setup do
    @jobsite = jobsites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobsites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobsite" do
    assert_difference('Jobsite.count') do
      post :create, jobsite: { city: @jobsite.city, name: @jobsite.name, state: @jobsite.state, street: @jobsite.street, zip: @jobsite.zip }
    end

    assert_redirected_to jobsite_path(assigns(:jobsite))
  end

  test "should show jobsite" do
    get :show, id: @jobsite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobsite
    assert_response :success
  end

  test "should update jobsite" do
    patch :update, id: @jobsite, jobsite: { city: @jobsite.city, name: @jobsite.name, state: @jobsite.state, street: @jobsite.street, zip: @jobsite.zip }
    assert_redirected_to jobsite_path(assigns(:jobsite))
  end

  test "should destroy jobsite" do
    assert_difference('Jobsite.count', -1) do
      delete :destroy, id: @jobsite
    end

    assert_redirected_to jobsites_path
  end
end
