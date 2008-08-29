class NotesController < ApplicationController
  # GET /note
  # GET /note.xml
  def index
    @notes = Note.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @notes }
    end
  end

  # GET /note/1
  # GET /note/1.xml
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @note }
    end
  end

  # GET /note/new
  # GET /note/new.xml
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @note }
    end
  end

  # GET /note/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /note
  # POST /note.xml
  def create
    @note = Note.new(params[:note])
    respond_to do |format|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        format.html { redirect_to(note_path(@note)) }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        flash[:notice] = 'Note was NOT successfully created.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /note/1
  # PUT /note/1.xml
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Note was successfully updated.'
        format.html { redirect_to(note_path(@note)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /note/1
  # DELETE /note/1.xml
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(notes_url) }
      format.xml  { head :ok }
    end
  end
end
