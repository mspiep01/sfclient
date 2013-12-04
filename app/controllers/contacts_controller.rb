class ContactsController < ApplicationController ##SFDC contacts
  include Databasedotcom::Rails::Controller
  
  def index
    @contacts = Contact.all
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
     @contact = Contact.find(params[:id])
     @contact.update_attributes(params[:contact])
     redirect_to @contact
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    @contact.RecordTypeId = "012i0000000Q2OQ"
    user = User.first
    @contact.OwnerId = user.Id
    @contact.class.description["fields"].select{|field| field['type'] =~ /boolean/ }.each do |field|
        if field['defaultValue'].nil? && field['nillable'] == false && field['defaultedOnCreate'] == true && field['createable'] == true
          @contact.send("#{field["name"]}=", false)
        end
      end
    redirect_to @contact if @contact.save
  end
  
end