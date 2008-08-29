require File.dirname(__FILE__) + '/../../spec_helper'

describe "/note/edit.haml" do
  include NotesHelper
  
  before do
    @note = mock_model(Note)
    @note.stub!(:text).and_return("MyString")
    @note.stub!(:contact_id).and_return("1")
    @note.stub!(:public_note).and_return(false)
    assigns[:note] = @note
  end

  it "should render edit form" do
    render "/notes/edit.haml"
    
    response.should have_tag("form[action=#{note_path(@note)}][method=post]") do
      with_tag('input#note_text[name=?]', "note[text]")
      with_tag('input#note_public_note[name=?]', "note[public_note]")
    end
  end
end