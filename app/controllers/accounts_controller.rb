class AccountsController < ApplicationController ##SFDC Accounts/Organizations
  include Databasedotcom::Rails::Controller
  
  def index
    @accounts = Account.all
  end
  
end