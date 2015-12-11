# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:url] = 'seltgroup14project.s3.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-east-1.amazonaws.com'