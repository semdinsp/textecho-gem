module Textecho
  class Timecheck < Textecho::Base

    
   def check_keyword()
     help_resp={"en"=>"send time to xxxx","te"=>"teturm: time to xxxx", "ba"=>"bahasa: time to xxxx"}
     out="Time is: #{Time.now.to_s}" if self.input_message.chomp=="time"
     out=self.help(help_resp) if self.input_message.chomp!="time"
     out
   end
   def process()
    self.output_message=check_keyword()
    puts "outbound message is "+ self.output_message if debug
    self.add_msg(self.output_message)
    self.msgs
   end
  end
end