require 'test_helper'

class AllReportsControllerTest < ActionController::TestCase
  setup do
    @all_report = all_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:all_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create all_report" do
    assert_difference('AllReport.count') do
      post :create, all_report: {  }
    end

    assert_redirected_to all_report_path(assigns(:all_report))
  end

  test "should show all_report" do
    get :show, id: @all_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @all_report
    assert_response :success
  end

  test "should update all_report" do
    patch :update, id: @all_report, all_report: {  }
    assert_redirected_to all_report_path(assigns(:all_report))
  end

  test "should destroy all_report" do
    assert_difference('AllReport.count', -1) do
      delete :destroy, id: @all_report
    end

    assert_redirected_to all_reports_path
  end
end
