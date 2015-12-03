class Building < ActiveRecord::Base
    validates :management, presence: true
    validates :address, presence: true

    has_many :apartments
    has_many :users, :through => :apartments
    
  def self.search(searchaddress, searchcompany)
    where("address LIKE ?", "%#{searchaddress}%") 
    where("management LIKE ?", "%#{searchcompany}%")
  end
end