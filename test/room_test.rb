require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test
  def setup
    @room1 = Room.new(:bedroom, 10, '13')
    @room2 = Room.new(:living_room, 15, '12')
  end

  def test_it_exists
    assert_instance_of Room, @room1
  end

  def test_it_has_a_category
    assert_equal :bedroom, @room1.category
  end

  def test_it_has_dimensions
    assert_equal 10, @room1.length
    assert_equal '13', @room1.width
    assert_equal 15, @room2.length
    assert_equal '12', @room2.width
  end

  def test_it_can_get_area
    assert_equal 130, @room1.area
    assert_equal 180, @room2.area
  end

  def test_is_not_painted_by_default
    assert_equal false, @room1.is_painted?
  end

  def test_it_can_be_painted
    assert_equal false, @room1.is_painted?
    @room1.paint
    assert @room1.is_painted?
  end
end
