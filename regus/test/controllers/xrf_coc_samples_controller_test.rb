require 'test_helper'

class XrfCocSamplesControllerTest < ActionController::TestCase
  setup do
    @xrf_coc_sample = xrf_coc_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xrf_coc_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xrf_coc_sample" do
    assert_difference('XrfCocSample.count') do
      post :create, xrf_coc_sample: { category: @xrf_coc_sample.category, color: @xrf_coc_sample.color, condition: @xrf_coc_sample.condition, location: @xrf_coc_sample.location, material: @xrf_coc_sample.material, reading: @xrf_coc_sample.reading, sample_num: @xrf_coc_sample.sample_num, xrf_coc_id: @xrf_coc_sample.xrf_coc_id }
    end

    assert_redirected_to xrf_coc_sample_path(assigns(:xrf_coc_sample))
  end

  test "should show xrf_coc_sample" do
    get :show, id: @xrf_coc_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xrf_coc_sample
    assert_response :success
  end

  test "should update xrf_coc_sample" do
    patch :update, id: @xrf_coc_sample, xrf_coc_sample: { category: @xrf_coc_sample.category, color: @xrf_coc_sample.color, condition: @xrf_coc_sample.condition, location: @xrf_coc_sample.location, material: @xrf_coc_sample.material, reading: @xrf_coc_sample.reading, sample_num: @xrf_coc_sample.sample_num, xrf_coc_id: @xrf_coc_sample.xrf_coc_id }
    assert_redirected_to xrf_coc_sample_path(assigns(:xrf_coc_sample))
  end

  test "should destroy xrf_coc_sample" do
    assert_difference('XrfCocSample.count', -1) do
      delete :destroy, id: @xrf_coc_sample
    end

    assert_redirected_to xrf_coc_samples_path
  end
end
