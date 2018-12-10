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


end
