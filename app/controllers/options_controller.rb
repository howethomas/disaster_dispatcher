class OptionsController < ApplicationController
  # GET /option
  # GET /option.xml

  # GET /option/1/edit
  def edit
    @option = Option.find_by_user_id(current_user.id)
    if @option.nil?
      @option = Option.new
      @option.save
    end
  end

  # PUT /option/1
  # PUT /option/1.xml
  def update
    @option = Option.find(params[:id])
    @option.user_id = current_user.id
    
    respond_to do |format|
      if @option.update_attributes(params[:option])     
        format.html {redirect_to :controller => "dashboard", :action => "index"}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @option.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # POST /option
  # POST /option.xml
  def create
    @option = Option.new(params[:option])
    @option.user_id = current_user.id
    respond_to do |format|
      if @option.save
        format.html {redirect_to :controller => "dashboard", :action => "index"}
        format.xml  { head :ok }        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @option.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /option/new
  # GET /option/new.xml
  def new
    @option = Option.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @contact }
    end
  end
  
  
end
