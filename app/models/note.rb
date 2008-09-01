class Note < ActiveRecord::Base
  def send_sms(caller_id, to_number)
    RAILS_DEFAULT_LOGGER.info("Sending a message to #{to_number}")
    if SEND_SMS == true
      a=Clickatell.new(caller_id,to_number,body)
      a.login!
      a.send!
    else
      RAILS_DEFAULT_LOGGER.info("Would have sent message #{body} to #{to_number}")
    end
  end
  
end