require File.dirname(__FILE__) + '/../../spec_helper'

describe "/notes/new.haml" do
  include NotesHelper
  
  before do
    @note = mock_model(Note)
    @note.stub!(:new_record?).and_return(true)
    @note.stub!(:text).and_return("MyString")
    @note.stub!(:contact_id).and_return("1")
    @note.stub!(:public_note).and_return(false)
    assigns[:note] = @note
  end

  it "should render new form" do
    render "/notes/new.haml"
    
    response.should have_tag("form[action=?][method=post]", notes_path) do
      with_tag("input#note_text[name=?]", "note[text]")
      with_tag("input#note_public_note[name=?]", "note[public_note]")
    end
  end
end
