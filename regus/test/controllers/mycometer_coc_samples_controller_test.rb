require 'test_helper'

class MycometerCocSamplesControllerTest < ActionController::TestCase
  setup do
    @mycometer_coc_sample = mycometer_coc_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mycometer_coc_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mycometer_coc_sample" do
    assert_difference('MycometerCocSample.count') do
      post :create, mycometer_coc_sample: { av: @mycometer_coc_sample.av, bsv: @mycometer_coc_sample.bsv, bv1: @mycometer_coc_sample.bv1, bv2: @mycometer_coc_sample.bv2, cv: @mycometer_coc_sample.cv, location: @mycometer_coc_sample.location, mycometer_coc_id: @mycometer_coc_sample.mycometer_coc_id, result: @mycometer_coc_sample.result, sample_num: @mycometer_coc_sample.sample_num }
    end

    assert_redirected_to mycometer_coc_sample_path(assigns(:mycometer_coc_sample))
  end

  test "should show mycometer_coc_sample" do
    get :show, id: @mycometer_coc_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mycometer_coc_sample
    assert_response :success
  end

  test "should update mycometer_coc_sample" do
    patch :update, id: @mycometer_coc_sample, mycometer_coc_sample: { av: @mycometer_coc_sample.av, bsv: @mycometer_coc_sample.bsv, bv1: @mycometer_coc_sample.bv1, bv2: @mycometer_coc_sample.bv2, cv: @mycometer_coc_sample.cv, location: @mycometer_coc_sample.location, mycometer_coc_id: @mycometer_coc_sample.mycometer_coc_id, result: @mycometer_coc_sample.result, sample_num: @mycometer_coc_sample.sample_num }
    assert_redirected_to mycometer_coc_sample_path(assigns(:mycometer_coc_sample))
  end

  test "should destroy mycometer_coc_sample" do
    assert_difference('MycometerCocSample.count', -1) do
      delete :destroy, id: @mycometer_coc_sample
    end

    assert_redirected_to mycometer_coc_samples_path
  end
end
