class Task < ActiveRecord::Base
  attr_accessible :description
  validates :description, :presence => true

  # The belongs_to association is described here: 
  # http://guides.rubyonrails.org/association_basics.html#the-belongs_to-association
  # It requires us to add the field 'list_id' to the tasks table.
  belongs_to :list
end
