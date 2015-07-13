class PersonAttribute < ActiveRecord::Base

  scope :active, -> { where(:active => true) }

  ID = "id"

end
