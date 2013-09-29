require File.dirname(__FILE__) + '/test_helper.rb'

class TestEcho < Test::Unit::TestCase

  def setup
    @f=Textecho::Base.new
    @f.shortcode='123'
    @myMsg='my message'
    @myMsg2 = "My Message Two"
    @source=123
  end
  
  def test_local
    msgs=@f.handle_message(@source,@myMsg,@f.shortcode)
      assert msgs=@f.msgs, "messages and list not same"
    assert @f.msgs.first.include?(@myMsg), "message not echoed"
  end
  def test_downcase
    
    msgs=@f.handle_message(@source,@myMsg2,@f.shortcode)
      assert msgs=@f.msgs, "messages and list not same"
    assert !@f.msgs.first.include?(@myMsg2), "message should be downcase"
    assert @f.msgs.first.include?(@myMsg2.downcase), "message should be downcase"
  end
  
  def test_rand
    @f=Textecho::Randgen.new
    msgs=@f.handle_message(@source,@myMsg,@f.shortcode)
    assert msgs=@f.output_list, "messages and list not same"
    assert @f.msgs.first != @myMsg, "message echoed"
  end
  
  def test_time
    @f=Textecho::Timecheck.new
    @f.shortcode='456'
    t=Time.now.to_s
    msgs=@f.handle_message(@source,"time", @f.shortcode)
    assert msgs=@f.msgs, "messages and list not same"
    msg=@f.msgs.first
    assert msg.include?(t), "message [#{msg}] [#{t}] "
  end
  def test_time_not_keyword
    @f=Textecho::Timecheck.new
    @f.shortcode='123'
    t=Time.now.to_s
    msgs=@f.handle_message(@source,"help", @f.shortcode)
    assert msgs.first.include?("Help Message:"), "should be help message but was #{msgs.first}"
  end
  def test_multi
     @f=Textecho::Multimessage.new   
     msgs=@f.handle_message(@source,@myMsg, @f.shortcode)
     puts "multi messages are #{msgs.join(',')}"
     assert msgs.size > 0
     msg=@f.msgs.first
     assert msg[0] == "0", "first element shoud be 0 but is: [#{msg[0]}]"
   end
 

end