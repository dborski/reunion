require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Activity, @activity
  end

  def test_it_has_readable_attributes
    assert_equal "Brunch", @activity.name
  end

  def test_it_has_no_participants_by_default
    assert_equal ({}), @activity.participants
  end

  def test_can_add_participants
    @activity.add_participant("Maria", 20)

    expected = {"Maria" => 20}
    assert_equal expected, @activity.participants

    @activity.add_participant("Luther", 40)

    expected2 = {"Maria" => 20, "Luther" => 40}
    assert_equal expected2, @activity.participants
  end

  def test_total_cost
    @activity.add_participant("Maria", 20)
    assert_equal 20, @activity.total_cost

    @activity.add_participant("Luther", 40)
    assert_equal 60, @activity.total_cost
  end

  def test_can_split_costs
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 30, @activity.split
  end
end


# ### Iteration 2: Activity Calculations and creating Reunions
#
# Use TDD to update the Activity class so that it responds to the following interaction pattern.
#
# For the `split` method, it is assumed that the cost is evenly distributed amongst participants.
# It should be the total cost divided by the number of participants.
#
# For the `owed` method, the amount each person owes is the difference between what they paid and
# the `split`. If a participant paid less than their fair share they owe a positive amount.
# If a participant paid more than their fair share they owe a negative amount
# (meaning they are owed money).
#

#
# activity.owed
# # => {"Maria" => 10, "Luther" => -10}
# ```
#
# Additionaly, use TDD to create a Reunion class that responds to the following interaction pattern:
#
# ```ruby
# require './lib/reunion'
# # => true
#
# reunion = Reunion.new("1406 BE")
# # => #<Reunion:0x007fe4ca1defc8 ...>
#
# reunion.name
# # => "1406 BE"
#
# reunion.activities
# # => []
#
# activity_1 = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1d9438 ...>
#
# reunion.add_activity(activity_1)
#
# reunion.activities
# # => [#<Activity:0x007fe4ca1d9438 ...>]
