require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_readable_attributes
    assert_equal "1406 BE", @reunion.name
  end

  def test_has_no_activites_by_default
    assert_equal [], @reunion.activities
  end

  def test_can_add_activites
    @reunion.add_activity(@activity_1)

    assert_equal [@activity_1], @reunion.activities
  end

  def test_total_cost
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)

    assert_equal 60, @reunion.total_cost

    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    assert_equal 180, @reunion.total_cost
  end

  def test_can_calculate_breakout
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    expected = {"Maria" => -10, "Luther" => -30, "Louis" => 40}
    assert_equal expected, @reunion.breakout
  end
end


### Iteration 3: Reunion Calculations

# Use TDD to update your Reunion class to respond to the following interaction pattern.
#
# For the `breakout` method, the key is a person's name and the value is what they owe
# for the whole reunion. This should be the combination of what they owe from all activities.
# Again, a negative value means they are owed money. In the following example, `"Maria"` owes 10
# from brunch and is owed 20 from drinks, so her final amount owed in the breakout is -10.
#

# reunion.breakout
# # => {"Maria" => -10, "Luther" => -30, "Louis" => 40}
#
# reunion.summary
# # => "Maria: -10\nLuther: -30\nLouis: 40"
#
# puts reunion.summary
# Maria: -10
# Luther: -30
# Louis: 40
