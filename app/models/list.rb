class List < ActiveRecord::Base

  # These are the attributes on the List model that are allowed to be "mass-assigned"
  # http://guides.rubyonrails.org/security.html#mass-assignment
  attr_accessible :name

  # This will prevent a List object from being created if it does not have a name
  # http://guides.rubyonrails.org/active_record_validations_callbacks.html#validations-overview
  validates :name, :presence => true

  # The has_many association is usually paired with a belongs_to association. It does not require a 
  # new attribute to be added to the lists table
  # http://guides.rubyonrails.org/association_basics.html#the-has_many-association
  has_many :tasks

  def add_task(task)
    tasks.push(task)
  end

  def incomplete_tasks
    tasks.where(completed: false)
  end
end
