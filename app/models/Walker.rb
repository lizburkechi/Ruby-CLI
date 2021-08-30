class Walker < ActiveRecord::Base
  has_many :walks
  has_many :users, through: :walk
end
