class Apartment < ActiveRecord::Base
    belongs_to :building
    belongs_to :user
    has_many :reviews
    
    VALID_NUMBER = /\A\d+\z/
    validates :apartment_number, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_NUMBER}
    validates :bedrooms, presence: true, format: {with: VALID_NUMBER}
    validates :bathrooms, presence: true, format: {with: VALID_NUMBER}
    validates :rent, presence: true, format: {with: VALID_NUMBER}
    validates :monthly_util, presence: true, format: {with: VALID_NUMBER}
    
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
