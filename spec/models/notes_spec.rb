require File.dirname(__FILE__) + '/../spec_helper'

describe Note do
  before(:each) do
    @note = Note.new
  end

  it "should be valid" do
    @note.should be_valid
  end
end
