class Image < ActiveRecord::Base
    belongs_to :apartment
    
    # has_attached_file :picture,
    # :storage => :s3,
    # :bucket => "seltgroup14project",
    # :s3_credentials => {
    #   :access_key_id     => "AKIAJP5VICAAPZTDTW4A",
    #   :secret_access_key => "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" },
    # :s3_protocol    => "https",
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
    
    
end
