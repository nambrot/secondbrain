class Product
  include Flex::ActiveModel

  # if we omit the next line, the elasticsearch type would have been 'product' by default

  attribute :name
  # optional elasticsearch properties mapping
  attribute :price, :properties => {'type' => 'float'}, :default => 0

  # :analyzed => false is a shortcut to :properties => { 'type' => 'string', 'index' => 'not_analyzed' }
  attribute :color, :analyzed => false

  # this adds a :created_at and :updated_at attributes
  attribute_timestamps

  # standard validation
  validate :name, :presence => true

  # standard callback
  before_create { self.name = name.titleize }

  # named scope
  scope :red, term(:color => 'red')

end
