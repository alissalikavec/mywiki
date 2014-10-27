class Wiki < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :last_edited_by, :updated_at

  #Validations
  validates_presence_of :title, :content, :user_id

  #Relationships
  belongs_to :user
end
