require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_readable_attributes
    assert_equal "1406 BE", @reunion.name
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
