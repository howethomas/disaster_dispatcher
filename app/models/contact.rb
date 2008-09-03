class Contact < ActiveRecord::Base
  validates_presence_of :cell
  
end