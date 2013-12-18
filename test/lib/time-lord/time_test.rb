require 'helper'

class TestTimeLordTime < MiniTest::Unit::TestCase
  def setup
    @timestamp = Time.now
  end

  def test_to_words_past_seconds
    expected = "50 秒前"
    actual = TimeLord::Time.new(@timestamp - 50).period.to_words
    assert_equal(expected, actual)
  end

  def test_to_words_singular
    expected = "1 分钟前"
    actual = TimeLord::Time.new(@timestamp - 60).period.to_words
    assert_equal(expected, actual)
  end

  def test_to_words_future_days
    expected = "2 天前"
    actual = TimeLord::Time.new(@timestamp - 172800).period.to_words
    assert_equal(expected, actual)
  end

  def test_to_words_future_days
    expected = "2 天后"
    actual = TimeLord::Time.new(@timestamp + 172800).period.to_words
    assert_equal(expected, actual)
  end
end
