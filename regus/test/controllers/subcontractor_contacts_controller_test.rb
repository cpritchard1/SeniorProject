require 'test_helper'

class SubcontractorContactsControllerTest < ActionController::TestCase
  setup do
    @subcontractor_contact = subcontractor_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcontractor_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcontractor_contact" do
    assert_difference('SubcontractorContact.count') do
      post :create, subcontractor_contact: { email: @subcontractor_contact.email, name: @subcontractor_contact.name, phone: @subcontractor_contact.phone, subcontractor_id: @subcontractor_contact.subcontractor_id }
    end

    assert_redirected_to subcontractor_contact_path(assigns(:subcontractor_contact))
  end

  test "should show subcontractor_contact" do
    get :show, id: @subcontractor_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcontractor_contact
    assert_response :success
  end

  test "should update subcontractor_contact" do
    patch :update, id: @subcontractor_contact, subcontractor_contact: { email: @subcontractor_contact.email, name: @subcontractor_contact.name, phone: @subcontractor_contact.phone, subcontractor_id: @subcontractor_contact.subcontractor_id }
    assert_redirected_to subcontractor_contact_path(assigns(:subcontractor_contact))
  end

  test "should destroy subcontractor_contact" do
    assert_difference('SubcontractorContact.count', -1) do
      delete :destroy, id: @subcontractor_contact
    end

    assert_redirected_to subcontractor_contacts_path
  end
end
