Flex::Configuration.configure do |config|
   config.http_client.base_uri = ENV['ELASTIC_SEARCH_URL'] || 'http://localhost:9200'
   config.flex_models = %w[ Url Product ]
   config.flex_active_models = %w[ Url Product ]
   config.variables[:index] = "url"
end