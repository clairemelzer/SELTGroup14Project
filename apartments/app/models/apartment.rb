class Apartment < ActiveRecord::Base
    belongs_to :building
    belongs_to :user
    has_many :reviews
    
    def each(&block)
        @apartments.each(&block)
    end
    
  def self.filter(filterbalcony)
    where("balcony LIKE ?", "t") 
  end
end
