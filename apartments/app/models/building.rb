class Building < ActiveRecord::Base
    validates :management, presence: true
    validates :address, presence: true

end