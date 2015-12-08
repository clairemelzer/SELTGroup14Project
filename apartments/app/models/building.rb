class Building < ActiveRecord::Base
    validates :management, presence: true
    validates :address, presence: true

    has_many :apartments
    has_many :users, :through => :apartments
    
  def self.searchaddress(search)
    where("address LIKE ?", "%#{search}%") 
  end
  
  def self.searchcompany(search)
    where("management LIKE ?", "%#{search}%")
  end
  
  def self.searchparking(search)
    where("parking LIKE ?", "%#{search}%")
  end
  
  def self.searchpets(search)
    where("pets LIKE ?", "%#{search}%")
  end
  
end