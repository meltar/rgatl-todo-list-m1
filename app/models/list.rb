class List < ActiveRecord::Base

  # These are the attributes on the List model that are allowed to be "mass-assigned"
  # http://guides.rubyonrails.org/security.html#mass-assignment
  attr_accessible :name

  # This will prevent a List object from being created if it does not have a name
  # http://guides.rubyonrails.org/active_record_validations_callbacks.html#validations-overview
  validates :name, :presence => true
  
end
