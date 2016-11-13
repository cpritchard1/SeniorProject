require 'test_helper'

class LeadReportNegsControllerTest < ActionController::TestCase
  setup do
    @lead_report_neg = lead_report_negs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lead_report_negs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lead_report_neg" do
    assert_difference('LeadReportNeg.count') do
      post :create, lead_report_neg: { address: @lead_report_neg.address, analytics: @lead_report_neg.analytics, assumptions: @lead_report_neg.assumptions, cac: @lead_report_neg.cac, cdph: @lead_report_neg.cdph, company: @lead_report_neg.company, consultant: @lead_report_neg.consultant, contact: @lead_report_neg.contact, date: @lead_report_neg.date, instrument: @lead_report_neg.instrument, jobsite_addr: @lead_report_neg.jobsite_addr, jobsite_name: @lead_report_neg.jobsite_name, nv: @lead_report_neg.nv, purpose: @lead_report_neg.purpose, results: @lead_report_neg.results, service: @lead_report_neg.service, xrf_coc_id: @lead_report_neg.xrf_coc_id }
    end

    assert_redirected_to lead_report_neg_path(assigns(:lead_report_neg))
  end

  test "should show lead_report_neg" do
    get :show, id: @lead_report_neg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lead_report_neg
    assert_response :success
  end

  test "should update lead_report_neg" do
    patch :update, id: @lead_report_neg, lead_report_neg: { address: @lead_report_neg.address, analytics: @lead_report_neg.analytics, assumptions: @lead_report_neg.assumptions, cac: @lead_report_neg.cac, cdph: @lead_report_neg.cdph, company: @lead_report_neg.company, consultant: @lead_report_neg.consultant, contact: @lead_report_neg.contact, date: @lead_report_neg.date, instrument: @lead_report_neg.instrument, jobsite_addr: @lead_report_neg.jobsite_addr, jobsite_name: @lead_report_neg.jobsite_name, nv: @lead_report_neg.nv, purpose: @lead_report_neg.purpose, results: @lead_report_neg.results, service: @lead_report_neg.service, xrf_coc_id: @lead_report_neg.xrf_coc_id }
    assert_redirected_to lead_report_neg_path(assigns(:lead_report_neg))
  end

  test "should destroy lead_report_neg" do
    assert_difference('LeadReportNeg.count', -1) do
      delete :destroy, id: @lead_report_neg
    end

    assert_redirected_to lead_report_negs_path
  end
end
