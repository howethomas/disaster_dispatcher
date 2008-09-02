class NoteObserver < ActiveRecord::Observer
  
 def after_save(note)
  o = Option.find_by_user_id(note.user_id)
  twitter= Twitter::Base.new(o.twitter_user,o.twitter_pass)
  twitter.post note.text
 end
 
end
