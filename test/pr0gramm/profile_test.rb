require 'test_helper'

class Pr0grammProfileTest < Minitest::Test
  def test_own_not_logged_in
    anon = Pr0gramm.new

    assert_raises('404 Not Found') do # No username, no user can be found
      anon.profile
    end

    # likes are never THAT public
    public_profile = anon.profile(ENV['PR0_USERNAME'])
    assert_equal(0, public_profile.like_count)
    assert_equal(false, public_profile.likes_are_public)
  end

  def test_own
    pr0 = Pr0gramm.new(username: ENV['PR0_USERNAME'], password: ENV['PR0_PASSWORD'])

    profile = pr0.profile

    assert_equal(ENV['PR0_USERNAME'], profile.name)
    assert_equal('Sat, 18 Apr 2015 13:36:24 +0200'.to_datetime, profile.registered)
    assert_equal(0, profile.score)
    assert_equal('Neuschwuchtel', profile.mark)
    assert_equal(false, profile.admin)
    assert_equal(false, profile.banned)
    assert_equal(2, profile.comment_count)
    assert_equal(0, profile.upload_count)
    assert_equal(2, profile.like_count)
    assert_equal(0, profile.tag_count)
    assert_equal(0, profile.follow_count)
    assert_equal(true, profile.likes_are_public)
    assert_equal(false, profile.following)
    assert_equal(1, profile.badges.size)
  end

  def test_cha0s
    pr0 = Pr0gramm.new

    profile = pr0.profile('cha0s')

    assert_equal('cha0s', profile.name)
    assert_equal('Sun, 14 Oct 2007 01:10:19 +0200'.to_datetime, profile.registered)
    assert_equal('Admin', profile.mark) # Still got the title
    assert_equal(false, profile.admin) # but no power
    assert_equal(false, profile.banned)
    assert_equal(1225, profile.comment_count)
    assert_equal(1564, profile.upload_count)
    assert_equal(1133, profile.like_count)
    assert_equal(1637, profile.tag_count)
    assert_equal(0, profile.follow_count)
    assert_equal(true, profile.likes_are_public)
    assert_equal(false, profile.following)

    assert_equal(2, profile.badges.size)
  end
end
