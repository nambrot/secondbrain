class Url
  include ActiveModel::Model
  include Flex::ActiveModel
  
  attribute :url
  attribute :body
  attribute :user_id
  attribute_timestamps

  validate :url, presence: true
  validate :body, presence: true
  validate :user_id, presence: true

  
end