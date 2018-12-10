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

  def test_10_random_numbers_ten_index_long
    assert_equal("invalid", check_ten(1234567890))
  end

  def test_more_valid_with_hyphens
    assert_equal("valid", check_ten("0-321-14653-0"))
  end

  def test_for_x_check_number_ten
    assert_equal("valid", check_ten("877195869x"))
  end

  def test_ten_more
    assert_equal("invalid", check_ten(1123333))
  end

  def test_more_ten
    assert_equal("invalid", check_ten(1))
  end

  def test_ten
    assert_equal("invalid", check_ten(1233451245123451234))
  end

  def test_thirteen
    assert_equal("valid", check_thirteen("9780470059029"))
  end

  def test_thirteen_invalid_integer
    assert_equal("invalid", check_thirteen(1))
  end

  def test_thirteen_string
    assert_equal("invalid", check_thirteen("hello"))
  end

  def test_thirteen_with_random_numbers_thirteen_index_long
    assert_equal("invalid", check_thirteen("1234567890123"))
  end

  def test_thirteen_more_valid
    assert_equal("valid", check_thirteen("978-0-13-149505-0"))
  end

  def test_thirteen_moreeee
    assert_equal("valid", check_thirteen("978 0 471 48648 0"))
  end

  def test_thirteen_random
    assert_equal("invalid", check_thirteen("asdkwo1234555"))
  end


end
