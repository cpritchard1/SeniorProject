require 'test_helper'

class MycometerCocsControllerTest < ActionController::TestCase
  setup do
    @mycometer_coc = mycometer_cocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mycometer_cocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mycometer_coc" do
    assert_difference('MycometerCoc.count') do
      post :create, mycometer_coc: { ambient_temp: @mycometer_coc.ambient_temp, building_type: @mycometer_coc.building_type, cli_type: @mycometer_coc.cli_type, date: @mycometer_coc.date, duration: @mycometer_coc.duration, job_id: @mycometer_coc.job_id, job_type: @mycometer_coc.job_type, liters_minute: @mycometer_coc.liters_minute, mold_air: @mycometer_coc.mold_air, reaction_time: @mycometer_coc.reaction_time, sampling_method: @mycometer_coc.sampling_method, turnaround: @mycometer_coc.turnaround, user_id: @mycometer_coc.user_id }
    end

    assert_redirected_to mycometer_coc_path(assigns(:mycometer_coc))
  end

  test "should show mycometer_coc" do
    get :show, id: @mycometer_coc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mycometer_coc
    assert_response :success
  end

  test "should update mycometer_coc" do
    patch :update, id: @mycometer_coc, mycometer_coc: { ambient_temp: @mycometer_coc.ambient_temp, building_type: @mycometer_coc.building_type, cli_type: @mycometer_coc.cli_type, date: @mycometer_coc.date, duration: @mycometer_coc.duration, job_id: @mycometer_coc.job_id, job_type: @mycometer_coc.job_type, liters_minute: @mycometer_coc.liters_minute, mold_air: @mycometer_coc.mold_air, reaction_time: @mycometer_coc.reaction_time, sampling_method: @mycometer_coc.sampling_method, turnaround: @mycometer_coc.turnaround, user_id: @mycometer_coc.user_id }
    assert_redirected_to mycometer_coc_path(assigns(:mycometer_coc))
  end

  test "should destroy mycometer_coc" do
    assert_difference('MycometerCoc.count', -1) do
      delete :destroy, id: @mycometer_coc
    end

    assert_redirected_to mycometer_cocs_path
  end
end
