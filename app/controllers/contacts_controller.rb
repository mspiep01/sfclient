class ContactsController < ApplicationController ##SFDC contacts
  include Databasedotcom::Rails::Controller
  
  def index
    @contacts = Contact.all
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
end