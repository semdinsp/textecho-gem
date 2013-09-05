module Textecho
  class Randgen < Textecho::Base
   
   def process(src, msg)
    n=rand*10
    nn=rand*10
    self.output_message=n.to_s+" "+nn.to_s
    puts "outbound message is "+ self.output_message if debug
    self.output_message
   end
  end
end