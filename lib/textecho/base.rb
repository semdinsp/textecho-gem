require 'rubygems'


module Textecho
  class Base
    attr_accessor :input_message,:output_message, :output_list,:shortcode, :locale, :msg_source, :params
  def debug
    false
  end
  def msgs
    self.output_list
  end
  def disabled_message(locale=nil)
    ["Sorry this application (#{self.class.to_s}) is not enabled currently. Please try again later"]
  end
  
  def setup
    self.output_list = []
  end
  def help_prefix
    "Help Message: "
  end
  def help(resp)
    raise "help response needs to be hash" if !resp.is_a? Hash
    self.locale="en" if !resp.keys.include? self.locale   # set locale to english if not proper
    return  self.help_prefix + resp[self.locale]
  end
  def handle_message(src, msg, shortcode,locale=nil,params={})
    setup
    self.locale=locale
    self.msg_source=src
    self.shortcode=shortcode
    self.input_message=msg.downcase
    self.params=params
    puts "inspect is #{self.inspect} " if debug
    process()
  end
     # @@host= 'localhost:8083'
  def add_msg(msg)
    self.output_message=msg   #update to latest
    self.output_list << msg
  end
  def process()
      self.output_message="[#{self.input_message}] from #{self.msg_source} rcvd on #{self.shortcode}"
      puts "outbound message is "+ self.output_message if debug
      self.add_msg(self.output_message)
      self.output_list  #should return arrayge of mesages
  end
  

   end    # Class
end    #Module