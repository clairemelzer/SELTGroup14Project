class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness:true
    validates :password, presence: true
    
    
    def create_user (hash)
        @session_token = SecureRandom.base64(10)
        hash[:session_token] = @session_token
        @user = User.create!(hash)
        return @user
    end
end
