require 'test_helper'

class XrfCocsControllerTest < ActionController::TestCase
  setup do
    @xrf_coc = xrf_cocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xrf_cocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xrf_coc" do
    assert_difference('XrfCoc.count') do
      post :create, xrf_coc: { abatementlevel: @xrf_coc.abatementlevel, actionlevel: @xrf_coc.actionlevel, date: @xrf_coc.date, job_type_id: @xrf_coc.job_type_id, turnaround: @xrf_coc.turnaround, xrfmode: @xrf_coc.xrfmode, xrfunit: @xrf_coc.xrfunit }
    end

    assert_redirected_to xrf_coc_path(assigns(:xrf_coc))
  end

  test "should show xrf_coc" do
    get :show, id: @xrf_coc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xrf_coc
    assert_response :success
  end

  test "should update xrf_coc" do
    patch :update, id: @xrf_coc, xrf_coc: { abatementlevel: @xrf_coc.abatementlevel, actionlevel: @xrf_coc.actionlevel, date: @xrf_coc.date, job_type_id: @xrf_coc.job_type_id, turnaround: @xrf_coc.turnaround, xrfmode: @xrf_coc.xrfmode, xrfunit: @xrf_coc.xrfunit }
    assert_redirected_to xrf_coc_path(assigns(:xrf_coc))
  end

  test "should destroy xrf_coc" do
    assert_difference('XrfCoc.count', -1) do
      delete :destroy, id: @xrf_coc
    end

    assert_redirected_to xrf_cocs_path
  end
end
