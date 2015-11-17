class Apartment < ActiveRecord::Base
    belongs_to :building
    belongs_to :user
    
    def each(&block)
        @apartments.each(&block)
    end
end
