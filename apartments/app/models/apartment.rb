class Apartment < ActiveRecord::Base
    belongs_to :building
    belongs_to :user
    has_many :reviews
    
    def each(&block)
        @apartments.each(&block)
    end
    
    def self.filterbalcony(filterbalcony)
        where("balcony LIKE ?", "%#{filterbalcony}%")
    end
  
    def self.filterlaundry(filter)
       where("laundry_in_unit LIKE ?", "%#{filter}%")
    end
  
    def self.filterair(filter)
       where("central_air LIKE ?", "%#{filter}%")
    end
    
    def self.filterbedrooms(filter)
       where("bedrooms LIKE ?", "%#{filter}%")
    end
  
    def self.filterbathrooms(filter)
       where("bathrooms LIKE ?", "%#{filter}%")
    end
end
