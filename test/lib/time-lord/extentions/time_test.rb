require 'minitest/autorun'
require_relative '../../../helper'

class TestTimeLordExtentionsTime < MiniTest::Unit::TestCase
  def setup
    @timestamp = Time.now
  end

  def test_in_words_second
    expected = "1 second ago"
    actual = 1.second.ago.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_plural
    expected = "2 years ago"
    actual = 2.years.ago.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_past_year
    expected = "1 year ago"
    actual = 1.year.ago.in_words
    assert_equal(expected, actual)
  end

  def test_in_words_future_year
    expected = "1 year from now"
    actual = 1.year.from_now.in_words
    assert_equal(expected, actual)
  end

  def test_math
    expected = Time.now - 2.days
    actual = 2.days.ago.to_time
    assert_equal(expected.to_i, actual.to_i)
  end
end