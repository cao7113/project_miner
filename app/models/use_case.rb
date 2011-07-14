class UseCase < ActiveRecord::Base
  
  belongs_to :project

  acts_as_taggable
  acts_as_commentable
  
end
