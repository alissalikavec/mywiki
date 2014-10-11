class Wiki < ActiveRecord::Base
  attr_accessible :title, :content, :user_id

  #Validations
  validates_presence_of :title, :content, :user_id

  #Relationships
  #belongs_to :user  - waiting for devise to be installed before turning this on.
end
