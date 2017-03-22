require 'pr0gramm'
require 'test/unit'

class TestPr0grammMessage < Test::Unit::TestCase
  def setup
    @god = ENV['GOD']
    @message_text = "Hi #{@god}, thanks for coding me :)"
  end

  def test_inbox
    pr0 = Pr0gramm.new(username: ENV['PR0_USERNAME'], password: ENV['PR0_PASSWORD'])

    assert_equal(pr0.inbox, pr0.inbox(:all))
    assert_equal(0, pr0.inbox(:all).size)
    assert_equal([], pr0.inbox(:unread))

    message = pr0.inbox(:messages).first

    assert_equal(@message_text, message.message)
    assert_equal('Neuschwuchtel', message.sender_mark)
    assert_equal(ENV['PR0_USERNAME'], message.sender_name)
    assert_equal('Altschwuchtel', message.recipient_mark)
    assert_equal(@god, message.recipient_name)
  end

  def test_send
    pr0 = Pr0gramm.new(username: ENV['PR0_USERNAME'], password: ENV['PR0_PASSWORD'])
    pr0.private_message(@god, @message_text)
  end

end
