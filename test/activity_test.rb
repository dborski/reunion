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



end







# ### Iteration 1: Creating Activities
#
# Use TDD to create an Activity class that responds to the following interaction pattern.
#
# For the `add_participant` method, the first argument
# represents the name of someone who participated in the activity,
# and the second argument represents how much they paid for the activity.
#
# ```ruby
#require './lib/activity'
# # => true
#
#activity = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1df568 ...>
#
#activity.name
# # => "Brunch"
#
#activity.participants
# # => {}
#
#activity.add_participant("Maria", 20)
#
#activity.participants
# # => {"Maria" => 20}
#
#activity.total_cost
# # => 20
#
#activity.add_participant("Luther", 40)
#
#activity.participants
# # => {"Maria" => 20, "Luther" => 40}
#
#activity.total_cost
# # => 60
# ```
