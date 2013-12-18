require 'helper'

class TestTimeLordExtentionsTime < MiniTest::Unit::TestCase
  def setup
    @timestamp = Time.now
  end

  def oldstamp(minus)
    @timestamp - minus
  end

  def test_ago_in_words_on_time
    expected = "3 天前"
    actual = oldstamp(3.days).ago.in_words
    assert_equal(expected, actual)
  end

  def test_ago_in_words_about
    expected = "1 小时前"
    actual = oldstamp(100.minutes).ago.in_words
    assert_equal(expected, actual)
  end

  def test_ago_in_words_less_than_minute
    expected = "15 秒前"
    actual = oldstamp(15.seconds).ago.in_words
    assert_equal(expected, actual)
  end
end
