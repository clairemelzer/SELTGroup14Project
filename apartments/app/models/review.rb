class Review < ActiveRecord::Base
    belongs_to :apartment
    belongs_to :user
    
    validates :comments, presence: true
end