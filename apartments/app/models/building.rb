class Building < ActiveRecord::Base
    validates :management, presence: true
    validates :address, presence: true

    has_many :apartments
    has_many :users, :through => :apartments
    
  def self.search(search)
    where("address LIKE ?", "%#{search}%")
  end
end