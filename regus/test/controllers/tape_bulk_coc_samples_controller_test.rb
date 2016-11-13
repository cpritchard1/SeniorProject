require 'test_helper'

class TapeBulkCocSamplesControllerTest < ActionController::TestCase
  setup do
    @tape_bulk_coc_sample = tape_bulk_coc_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tape_bulk_coc_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tape_bulk_coc_sample" do
    assert_difference('TapeBulkCocSample.count') do
      post :create, tape_bulk_coc_sample: { collection_type: @tape_bulk_coc_sample.collection_type, location: @tape_bulk_coc_sample.location, sample_num: @tape_bulk_coc_sample.sample_num, tape_bulk_coc_id: @tape_bulk_coc_sample.tape_bulk_coc_id }
    end

    assert_redirected_to tape_bulk_coc_sample_path(assigns(:tape_bulk_coc_sample))
  end

  test "should show tape_bulk_coc_sample" do
    get :show, id: @tape_bulk_coc_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tape_bulk_coc_sample
    assert_response :success
  end

  test "should update tape_bulk_coc_sample" do
    patch :update, id: @tape_bulk_coc_sample, tape_bulk_coc_sample: { collection_type: @tape_bulk_coc_sample.collection_type, location: @tape_bulk_coc_sample.location, sample_num: @tape_bulk_coc_sample.sample_num, tape_bulk_coc_id: @tape_bulk_coc_sample.tape_bulk_coc_id }
    assert_redirected_to tape_bulk_coc_sample_path(assigns(:tape_bulk_coc_sample))
  end

  test "should destroy tape_bulk_coc_sample" do
    assert_difference('TapeBulkCocSample.count', -1) do
      delete :destroy, id: @tape_bulk_coc_sample
    end

    assert_redirected_to tape_bulk_coc_samples_path
  end
end
