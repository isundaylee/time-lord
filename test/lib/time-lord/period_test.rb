require 'helper'

class TestTimeLordPeriod < MiniTest::Unit::TestCase
  def setup
    @timestamp = Time.now
  end

  def teardown
    Timecop.return # undo any time changes
  end

  def test_to_i_positive
    expected = -100
    actual = TimeLord::Period.new(@timestamp - 100, @timestamp).difference
    assert_equal(expected, actual)
  end

  def test_to_i_negative
    expected = 100
    actual = TimeLord::Period.new(@timestamp + 100, @timestamp).difference
    assert_equal(expected, actual)
  end

  # def test_from
  #   expect = "some time period from a to b"
  #   actual = 1.hour.from(@timestamp)
  #   assert_equal(expected, actual)
  # end

  # def test_to
  #   expect = "some time period from a to b"
  #   actual = 1.hour.to(@timestamp)
  #   assert_equal(expected, actual)
  # end

  def test_in_words_less_than_second_ago
    expected = "刚刚"
    actual = Time.now.ago.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_less_than_second_from
    expected = "刚刚"
    actual = 0.seconds.from_now.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_second
    expected = "1 秒前"
    actual = 1.second.ago.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_plural
    expected = "2 年前"
    actual = 2.years.ago.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_past_year
    expected = "1 年前"
    actual = 1.year.ago.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_future_year
    expected = "1 年后"
    actual = 1.year.from_now.in_words
    assert_equal(expected, actual)
  end

  def test_math
    expected = Time.now - 2.days
    actual = 2.days.ago.to_time
    assert_equal(expected.to_i, actual.to_i)
  end
end
