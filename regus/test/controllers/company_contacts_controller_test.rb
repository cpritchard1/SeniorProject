require 'test_helper'

class CompanyContactsControllerTest < ActionController::TestCase
  setup do
    @company_contact = company_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_contact" do
    assert_difference('CompanyContact.count') do
      post :create, company_contact: { company_id: @company_contact.company_id, email: @company_contact.email, name: @company_contact.name, phone: @company_contact.phone }
    end

    assert_redirected_to company_contact_path(assigns(:company_contact))
  end

  test "should show company_contact" do
    get :show, id: @company_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_contact
    assert_response :success
  end

  test "should update company_contact" do
    patch :update, id: @company_contact, company_contact: { company_id: @company_contact.company_id, email: @company_contact.email, name: @company_contact.name, phone: @company_contact.phone }
    assert_redirected_to company_contact_path(assigns(:company_contact))
  end

  test "should destroy company_contact" do
    assert_difference('CompanyContact.count', -1) do
      delete :destroy, id: @company_contact
    end

    assert_redirected_to company_contacts_path
  end
end
