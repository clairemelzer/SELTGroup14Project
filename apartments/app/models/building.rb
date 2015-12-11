class Building < ActiveRecord::Base


    has_many :apartments
    has_many :users, :through => :apartments

 has_attached_file :picture,
    :storage => :s3,
    :bucket => ENV["S3_BUCKET_NAME"],
    
    :s3_credentials => {
      :access_key_id     => ENV["AWS_ACCESS_KEY_ID"],
      :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"] },
    :s3_protocol    => "https",
    
    styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  
   # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

    
  VALID_ADDRESS = /\A\d+\s*\w*\s*\w*\s*\w*\z/
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