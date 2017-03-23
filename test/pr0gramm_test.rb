require 'test_helper'

class Pr0grammTest < Minitest::Test
  def test_initialize_no_param
    pr0 = Pr0gramm.new

    assert_equal([:sfw], pr0.flags)
    assert(pr0.promoted)

    assert_instance_of(Pr0gramm::Requester, pr0.requester)
  end

  def test_initialize_param
    pr0 = Pr0gramm.new(flags: [:nsfl], promoted: false)

    assert_equal([:nsfl], pr0.flags)
    refute(pr0.promoted)

    assert_instance_of(Pr0gramm::Requester, pr0.requester)
  end
end
