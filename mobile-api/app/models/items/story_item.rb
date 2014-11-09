# This model represents an item that helps drive the story. They typically
# are used in presenting clues to riddles or providing backstory or
# atmosphere.
#
# McLean : 7-17-2014
#

class Items::StoryItem < ModelBase
  acts_as :item, :class_name => 'Items::Item'
end
