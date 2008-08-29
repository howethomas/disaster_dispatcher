require File.dirname(__FILE__) + '/../../spec_helper'

describe "/notes/index.haml" do
  include NotesHelper
  
  before do
    note_98 = mock_model(Note)
    note_98.should_receive(:text).and_return("MyString")
    note_98.should_receive(:contact_id).and_return("1")
    note_98.should_receive(:public_note).and_return(false)
    note_99 = mock_model(Note)
    note_99.should_receive(:text).and_return("MyString")
    note_99.should_receive(:contact_id).and_return("1")
    note_99.should_receive(:public_note).and_return(false)

    assigns[:notes] = [note_98, note_99]
  end

  it "should render list of notes" do
    render "/notes/index.haml"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", false, 2)
  end
end
