require File.dirname(__FILE__) + '/test_helper.rb'

class TestEcho < Test::Unit::TestCase

  def setup
    @f=Textecho::Base.new
    @myMsg='my message'
    @source=123
  end
  
  def test_local
    @f.handle_message(@source,@myMsg)
    assert @f.output_message == @myMsg, "message not echoed"
  end
  
  def test_rand
    @f=Textecho::Randgen.new
    @f.handle_message(@source,@myMsg)
    assert @f.output_message != @myMsg, "message echoed"
  end
  
 

end