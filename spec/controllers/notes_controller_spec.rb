require File.dirname(__FILE__) + '/../spec_helper'

describe NotesController, "#route_for" do

  it "should map { :controller => 'notes', :action => 'index' } to /notes" do
    route_for(:controller => "notes", :action => "index").should == "/notes"
  end
  
  it "should map { :controller => 'notes', :action => 'new' } to /notes/new" do
    route_for(:controller => "notes", :action => "new").should == "/notes/new"
  end
  
  it "should map { :controller => 'notes', :action => 'show', :id => 1 } to /notes/1" do
    route_for(:controller => "notes", :action => "show", :id => 1).should == "/notes/1"
  end
  
  it "should map { :controller => 'notes', :action => 'edit', :id => 1 } to /notes/1/edit" do
    route_for(:controller => "notes", :action => "edit", :id => 1).should == "/notes/1/edit"
  end
  
  it "should map { :controller => 'notes', :action => 'update', :id => 1} to /notes/1" do
    route_for(:controller => "notes", :action => "update", :id => 1).should == "/notes/1"
  end
  
  it "should map { :controller => 'notes', :action => 'destroy', :id => 1} to /notes/1" do
    route_for(:controller => "notes", :action => "destroy", :id => 1).should == "/notes/1"
  end
  
end

describe NotesController, "handling GET /notes" do

  before do
    @note = mock_model(Note)
    Note.stub!(:find).and_return([@note])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all notes" do
    Note.should_receive(:find).with(:all).and_return([@note])
    do_get
  end
  
  it "should assign the found notes for the view" do
    do_get
    assigns[:notes].should == [@note]
  end
end

describe NotesController, "handling GET /notes.xml" do

  before do
    @note = mock_model(Note, :to_xml => "XML")
    Note.stub!(:find).and_return(@note)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all notes" do
    Note.should_receive(:find).with(:all).and_return([@note])
    do_get
  end
  
  it "should render the found note as xml" do
    @note.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe NotesController, "handling GET /notes/1" do

  before do
    @note = mock_model(Note)
    Note.stub!(:find).and_return(@note)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the note requested" do
    Note.should_receive(:find).with("1").and_return(@note)
    do_get
  end
  
  it "should assign the found note for the view" do
    do_get
    assigns[:note].should equal(@note)
  end
end

describe NotesController, "handling GET /notes/1.xml" do

  before do
    @note = mock_model(Note, :to_xml => "XML")
    Note.stub!(:find).and_return(@note)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the note requested" do
    Note.should_receive(:find).with("1").and_return(@note)
    do_get
  end
  
  it "should render the found note as xml" do
    @note.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe NotesController, "handling GET /notes/new" do

  before do
    @note = mock_model(Note)
    Note.stub!(:new).and_return(@note)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new note" do
    Note.should_receive(:new).and_return(@note)
    do_get
  end
  
  it "should not save the new note" do
    @note.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new note for the view" do
    do_get
    assigns[:note].should equal(@note)
  end
end

describe NotesController, "handling GET /notes/1/edit" do

  before do
    @note = mock_model(Note)
    Note.stub!(:find).and_return(@note)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the note requested" do
    Note.should_receive(:find).and_return(@note)
    do_get
  end
  
  it "should assign the found note for the view" do
    do_get
    assigns[:note].should equal(@note)
  end
end

describe NotesController, "handling POST /notes" do

  before do
    @note = mock_model(Note, :to_param => "1")
    Note.stub!(:new).and_return(@note)
  end
  
  def post_with_successful_save
    @note.should_receive(:save).and_return(true)
    post :create, :note => {}
  end
  
  def post_with_failed_save
    @note.should_receive(:save).and_return(false)
    post :create, :note => {}
  end
  
  it "should create a new note" do
    Note.should_receive(:new).with({}).and_return(@note)
    post_with_successful_save
  end

  it "should redirect to the new note on successful save" do
    post_with_successful_save
    response.should redirect_to(note_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe NotesController, "handling PUT /notes/1" do

  before do
    @note = mock_model(Note, :to_param => "1")
    Note.stub!(:find).and_return(@note)
  end
  
  def put_with_successful_update
    @note.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @note.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the note requested" do
    Note.should_receive(:find).with("1").and_return(@note)
    put_with_successful_update
  end

  it "should update the found note" do
    put_with_successful_update
    assigns(:note).should equal(@note)
  end

  it "should assign the found note for the view" do
    put_with_successful_update
    assigns(:note).should equal(@note)
  end

  it "should redirect to the note on successful update" do
    put_with_successful_update
    response.should redirect_to(note_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe NotesController, "handling DELETE /note/1" do

  before do
    @note = mock_model(Note, :destroy => true)
    Note.stub!(:find).and_return(@note)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the note requested" do
    Note.should_receive(:find).with("1").and_return(@note)
    do_delete
  end
  
  it "should call destroy on the found note" do
    @note.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the notes list" do
    do_delete
    response.should redirect_to(notes_url)
  end
end
