module Textecho
  class Multimessage < Textecho::Base
   
   def process()
    n=rand*10.to_i
    0.upto(n)  {|i| amsg="#{i} of #{n} : #{Time.now}" 
    self.add_msg(amsg) }
    self.msgs
   end
  end
end