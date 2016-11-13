require 'test_helper'

class JobsiteContactsControllerTest < ActionController::TestCase
  setup do
    @jobsite_contact = jobsite_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobsite_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobsite_contact" do
    assert_difference('JobsiteContact.count') do
      post :create, jobsite_contact: { email: @jobsite_contact.email, jobsite_id: @jobsite_contact.jobsite_id, name: @jobsite_contact.name, phone: @jobsite_contact.phone }
    end

    assert_redirected_to jobsite_contact_path(assigns(:jobsite_contact))
  end

  test "should show jobsite_contact" do
    get :show, id: @jobsite_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobsite_contact
    assert_response :success
  end

  test "should update jobsite_contact" do
    patch :update, id: @jobsite_contact, jobsite_contact: { email: @jobsite_contact.email, jobsite_id: @jobsite_contact.jobsite_id, name: @jobsite_contact.name, phone: @jobsite_contact.phone }
    assert_redirected_to jobsite_contact_path(assigns(:jobsite_contact))
  end

  test "should destroy jobsite_contact" do
    assert_difference('JobsiteContact.count', -1) do
      delete :destroy, id: @jobsite_contact
    end

    assert_redirected_to jobsite_contacts_path
  end
end
