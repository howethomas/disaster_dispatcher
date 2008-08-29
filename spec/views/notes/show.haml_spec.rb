require File.dirname(__FILE__) + '/../../spec_helper'

describe "/notes/show.haml" do
  include NotesHelper
  
  before do
    @note = mock_model(Note)
    @note.stub!(:text).and_return("MyString")
    @note.stub!(:contact_id).and_return("1")
    @note.stub!(:public_note).and_return(false)

    assigns[:note] = @note
  end

  it "should render attributes in <p>" do
    render "/notes/show.haml"
    response.should have_text(/MyString/)
    response.should have_text(/als/)
  end
end

