class Url
  include ActiveModel::Model
  include Flex::ActiveModel
  
  attribute :url
  attribute :body
  attribute_timestamps

  validate :url, presence: true
  validate :body, presence: true

end