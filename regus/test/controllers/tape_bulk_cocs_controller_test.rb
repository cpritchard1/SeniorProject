require 'test_helper'

class TapeBulkCocsControllerTest < ActionController::TestCase
  setup do
    @tape_bulk_coc = tape_bulk_cocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tape_bulk_cocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tape_bulk_coc" do
    assert_difference('TapeBulkCoc.count') do
      post :create, tape_bulk_coc: { cli_type_id: @tape_bulk_coc.cli_type_id, date: @tape_bulk_coc.date, turnaround: @tape_bulk_coc.turnaround, user_id: @tape_bulk_coc.user_id }
    end

    assert_redirected_to tape_bulk_coc_path(assigns(:tape_bulk_coc))
  end

  test "should show tape_bulk_coc" do
    get :show, id: @tape_bulk_coc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tape_bulk_coc
    assert_response :success
  end

  test "should update tape_bulk_coc" do
    patch :update, id: @tape_bulk_coc, tape_bulk_coc: { cli_type_id: @tape_bulk_coc.cli_type_id, date: @tape_bulk_coc.date, turnaround: @tape_bulk_coc.turnaround, user_id: @tape_bulk_coc.user_id }
    assert_redirected_to tape_bulk_coc_path(assigns(:tape_bulk_coc))
  end

  test "should destroy tape_bulk_coc" do
    assert_difference('TapeBulkCoc.count', -1) do
      delete :destroy, id: @tape_bulk_coc
    end

    assert_redirected_to tape_bulk_cocs_path
  end
end
