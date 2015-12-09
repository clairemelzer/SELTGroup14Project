class Building < ActiveRecord::Base


    has_many :apartments
    has_many :users, :through => :apartments
    
  VALID_ADDRESS = /\d+\s*\w*\s*\w*\s*\w*/
  validates :address, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_ADDRESS}, length: {maximum: 50}
  validates :city, presence: true, length: {maximum: 50}
  validates :management, presence: true, length: {maximum: 50}
    
  def self.searchaddress(search)
    where("address LIKE ?", "%#{search}%") 
  end
  
  def self.searchcompany(search)
    where("management LIKE ?", "%#{search}%")
  end
  
  def self.searchcity(search)
    where("city LIKE ?", "%#{search}%")
  end
  
  def self.searchparking(search)
    where("parking LIKE ?", "%#{search}%")
  end
  
  def self.searchpets(search)
    where("pets LIKE ?", "%#{search}%")
  end
  
end