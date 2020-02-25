require 'aws-sdk'

region = ENV['AWS_REGION']
aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']

if Rails.env.production?
    Aws.config.update({
        region: region,
        credentials: Aws::Credentials.new(aws_access_key_id, aws_secret_access_key)
      })
end

# list buckets in Amazon S3
s3 = Aws::S3::Client.new
#logs all objects to check connection

s3.list_objects(bucket:'fifo-cloud').each do |response|
    puts response.contents.map(&:key)
  end
puts "S3 access granted"
