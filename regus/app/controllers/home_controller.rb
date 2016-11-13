class HomeController < ApplicationController

	def index
		if user_signed_in?
			@job = Job.new
			@my_jobs = current_user.jobs 

			@jobs = Job.all
			@lead_positive = LeadReport.all 
    		@lead_negative = LeadReportNeg.all 

			@job = Job.new
		    @company = Company.new
		    @company_contact = CompanyContact.new
		    @subcontractor = Subcontractor.new
		    @subcontractor_contact = SubcontractorContact.new
		    @jobsite = Jobsite.new
		    @jobsite_contact = JobsiteContact.new
		    set_states
		end

	end

    def set_states
      @states = [ ["Alabama","AL"],       ["Alaska","AK"],      ["Arizona","AZ"],         ["Arkansas","AR"],      ["California","CA"], 
                  ["Colorado","CO"],      ["Connecticut","CT"], ["Delaware", "DE"],       ["Florida","FL"],       ["Georgia","GA"],
                  ["Hawaii","HI"],        ["Idaho","ID"],       ["Illinois","IL"],        ["Indiana", "IN"],      ["Iowa", "IA"], 
                  ["Kansas","KS"],        ["Kentucky","KY"],    ["Louisana","LA"],        ["Maine","ME"],         ["Maryland","MD"], 
                  ["Massachusetts","MA"], ["Michigan","MI"],    ["Minnesota","MN"],       ["Mississippi","MS"],   ["Missouri","MO"], 
                  ["Montana","MT"],       ["Nebraska","NB"],    ["Nevada","NV"],          ["New Hampshire","NH"], ["New Jersey","NJ"], 
                  ["New Mexico","NM"],    ["New York","NY"],    ["North Carolina","NC"],  ["North Dakota","ND"],  ["Ohio","OH"], 
                  ["Oklahoma","OK"],      ["Oregon","OG"],      ["Pennsylvania","PA"],    ["Rhode Island","RI"],  ["South Carolina","SC"], 
                  ["South Dakota","SD"],  ["Tennessee","TN"],   ["Texas","TX"],           ["Utah","UT"],          ["Vermont","VT"], 
                  ["Virginia","VA"],      ["Washingont","WA"],  ["West Virginia","WV"],   ["Wisconsin","WI"],     ["Wyoming","WY"] ]
    end

end