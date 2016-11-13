require 'test_helper'

class LeadReportsControllerTest < ActionController::TestCase
  setup do
    @lead_report = lead_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lead_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lead_report" do
    assert_difference('LeadReport.count') do
      post :create, lead_report: { address: @lead_report.address, analytics: @lead_report.analytics, assumptions: @lead_report.assumptions, cac: @lead_report.cac, cdph: @lead_report.cdph, company: @lead_report.company, consultant: @lead_report.consultant, contact: @lead_report.contact, date: @lead_report.date, instrument: @lead_report.instrument, job_id: @lead_report.job_id, jobsite_addr: @lead_report.jobsite_addr, jobsite_name: @lead_report.jobsite_name, nv: @lead_report.nv, purpose: @lead_report.purpose, recommendations: @lead_report.recommendations, results: @lead_report.results, service: @lead_report.service }
    end

    assert_redirected_to lead_report_path(assigns(:lead_report))
  end

  test "should show lead_report" do
    get :show, id: @lead_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lead_report
    assert_response :success
  end

  test "should update lead_report" do
    patch :update, id: @lead_report, lead_report: { address: @lead_report.address, analytics: @lead_report.analytics, assumptions: @lead_report.assumptions, cac: @lead_report.cac, cdph: @lead_report.cdph, company: @lead_report.company, consultant: @lead_report.consultant, contact: @lead_report.contact, date: @lead_report.date, instrument: @lead_report.instrument, job_id: @lead_report.job_id, jobsite_addr: @lead_report.jobsite_addr, jobsite_name: @lead_report.jobsite_name, nv: @lead_report.nv, purpose: @lead_report.purpose, recommendations: @lead_report.recommendations, results: @lead_report.results, service: @lead_report.service }
    assert_redirected_to lead_report_path(assigns(:lead_report))
  end

  test "should destroy lead_report" do
    assert_difference('LeadReport.count', -1) do
      delete :destroy, id: @lead_report
    end

    assert_redirected_to lead_reports_path
  end
end
