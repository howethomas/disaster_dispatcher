require 'fastercsv'

class ContactsController < ApplicationController
  
  before_filter :login_required
  
  # GET /contact/1
  # GET /contact/1.xml
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contact/new
  # GET /contact/new.xml
  def new
    @contact = Contact.new
    @contact.screen_name = params[:screen_name]

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contact/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contact
  # POST /contact.xml
  def create
    @contact = Contact.new(params[:contact])
    @contact.account_id = current_user.account_id
    
    
    
    respond_to do |format|
      if @contact.save
        # Follow the contact
        o = Option.find_by_user_id(current_user.id)
        tw = Twitter::Base.new(o.twitter_user,o.twitter_pass)
        tw.post("follow #{@contact.screen_name}")
        
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to :controller => "dashboard" }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
        
        
        # Send him a welcome message
        begin
          tw.d(@contact.screen_name, "You will now receive updates. To send a message directly,")          
        rescue Exception => e
          # This might blow up because you can only send direct messages to people who follow you...
        end
        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact/1
  # PUT /contact/1.xml
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(contact_path(@contact)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact/1
  # DELETE /contact/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end
  
end
