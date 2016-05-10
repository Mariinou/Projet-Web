class UsersMatiere < ActiveRecord::Base
  belongs_to :user
  belongs_to :matiere
end
