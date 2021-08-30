class User < ActiveRecord::Base
    has_many :walks
    has_many :walkers, through: :walks
end
