class Walk < ActiveRecord::Base
    belongs_to :user
    belongs_to :walker  
end
