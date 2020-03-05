class Deal < ApplicationRecord

    def self.group_by_stage
        group(:percent).sum(:value)
    end
    
end
