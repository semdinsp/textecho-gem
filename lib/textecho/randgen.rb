module Textecho
  class Randgen < Textecho::Base
   
   def process()
    n=rand*10
    nn=rand*10
    self.output_message=n.to_s+" "+nn.to_s
    puts "outbound message is "+ self.output_message if debug
    self.add_msg(self.output_message)
    self.msgs
   end
  end
end