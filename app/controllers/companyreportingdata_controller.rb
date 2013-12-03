class CompanyreportingdataController < ApplicationController
  include Databasedotcom::Rails::Controller
  
  def index
    @crds = Company_Reporting_Data__c.all
  end
  
  def show
    @crd = Company_Reporting_Data__c.find_by_Id(params[:id])
  end
  
end