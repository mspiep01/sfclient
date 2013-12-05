class AccountsController < ApplicationController ##SFDC Accounts/Organizations

  include Databasedotcom::Rails::Controller

  def index
    @accounts = Account.all
  end
  
  def show
    @account = Account.find(params[:id])
    @contact = Contact.find_all_by_AccountId(params[:id])
    @crd = Company_Reporting_Data__c.find_all_by_Company_Name__c(params[:id])
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
     @account = Account.find(params[:id])
     @account.update_attributes(params[:account])
     redirect_to @account
  end

end