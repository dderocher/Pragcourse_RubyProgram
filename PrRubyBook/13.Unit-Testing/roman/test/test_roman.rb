require 'test/unit'
#require 'test_helper'
require  'romanbug'


class TestRoman < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end

  # Fake test
  def test_simple

    #fail('Not implemented')
    assert_equal('i', Roman.new(1).to_s)
    assert_equal("ii", Roman.new(2).to_s)
    assert_equal("iii", Roman.new(3).to_s)
    assert_equal("iv", Roman.new(4).to_s)
    assert_equal('ix', Roman.new(9).to_s)
  end

  def test_range
    #Should not raise exception
    Roman.new(1)
    Roman.new(4999)
      #Should raise exception
    assert_raises(RuntimeError)  {Roman.new(0)}
    assert_raises(RuntimeError)  {Roman.new(5000)}
  end

end