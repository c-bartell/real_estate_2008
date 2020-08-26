require "minitest/autorun"
require "minitest/pride"
require "./lib/room"
require "./lib/house"

class HouseTest < Minitest::Test
  def setup
    @house1 = House.new("$400000", "123 sugar lane")
    @house2 = House.new("$500000", "1212 Address Way")
    @house3 = House.new("$500001", "1213 Address Way")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists
    assert_instance_of House, @house1
  end

  def test_it_has_a_price
    assert_equal 400000, @house1.price
  end

  def test_it_has_an_address
    assert_equal "123 sugar lane", @house1.address
  end

  def test_it_has_no_rooms_by_default
    assert_equal [], @house1.rooms
  end

  def test_it_can_add_rooms
    assert_equal [], @house1.rooms
    @house1.add_room(@room_1)
    assert_equal [@room_1], @house1.rooms
    @house1.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house1.rooms
  end

  def test_is_above_market_average?
    assert_equal false, @house1.above_market_average?

    assert_equal false, @house2.above_market_average?

    assert @house3.above_market_average?
  end

  def test_it_can_group_rooms_by_category
    @house1.add_room(@room_1)
    @house1.add_room(@room_2)
    @house1.add_room(@room_3)
    @house1.add_room(@room_4)
    assert_equal [@room_1, @room_2, @room_3, @room_4], @house1.rooms

    assert_equal [@room_1, @room_2], @house1.rooms_from_category(:bedroom)
    assert_equal [@room_3], @house1.rooms_from_category(:living_room)
    assert_equal [@room_4], @house1.rooms_from_category(:basement)

  end

  def test_it_can_calculate_total_area_of_rooms
    @house1.add_room(@room_1)
    assert_equal 130, @house1.area

    @house1.add_room(@room_2)
    @house1.add_room(@room_3)
    @house1.add_room(@room_4)
    assert_equal 1900, @house1.area
  end

  def test_it_can_make_a_hash_of_details
    expected_details = {
      "price" => 400000,
      "address" => "123 sugar lane"
    }
    actual_details = @house1.details

    assert_equal expected_details, actual_details
  end
end
