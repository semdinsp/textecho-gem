require 'rubygems'


module Textecho
  class Base
    attr_accessor :input_message,:output_message
  def debug
    true
  end
  def handle_message(src, msg)
    self.input_message=msg
    puts "inbound message is "+ self.input_message if debug
    process(src, msg)
  end
     # @@host= 'localhost:8083'
  def process(src, msg)
      self.output_message=msg
      puts "outbound message is "+ self.output_message if debug
      self.output_message
  end
  

   end    # Class
end    #Module