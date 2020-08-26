require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test
  def test_it_exists
    room = Room.new(:bedroom, 10, '13')
    assert_instance_of Room, room
  end

  def test_it_has_a_category
    # skip
    room = Room.new(:bedroom, 10, '13')
    assert_equal :bedroom, room.category
  end

  def test_it_has_dimensions
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:living_room, 15, '12')
    assert_equal 10, room_1.length
    assert_equal '13', room1.width
    assert_equal 15, room2.length
    assert_equal '13', room2.width
  end

  def test_it_can_get_area
    skip
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:living_room, 15, '12')
    assert_equal 130, room1.area
    assert_equal 180, room2.area
  end

  def test_is_not_painted_by_default
    skip
    room1 = Room.new(:bedroom, 10, '13')
    assert_equal false, room1.is_painted?
  end

  def test_it_can_be_painted
    skip
    room1 = Room.new(:bedroom, 10, '13')
    assert_equal false, room1
    room1.paint
    assert room1.paint
  end
end
