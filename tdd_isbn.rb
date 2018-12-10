require "minitest/autorun"
require_relative "isbn.rb"

class My_test < Minitest::Test

  def test_one
    assert_equal(1,1)
  end

  def test_valid_ten
    assert_equal("valid", check_ten("0471958697"))
  end

  def test_false
    assert_equal("invalid", check_ten(111111111111111))
  end

  def test_letters
    assert_equal("invalid", check_ten("hello"))
  end

  def test_10_random_numbers
    assert_equal("invalid", check_ten(1234567890))
  end

  def test_more_valid_with_hyphens
    assert_equal("valid", check_ten("0-321-14653-0"))
  end

  def test_for_x_check_number
    assert_equal("valid", check_ten("877195869x"))
  end

end
