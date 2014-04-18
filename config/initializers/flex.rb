Flex::Configuration.configure do |config|
   config.http_client.base_uri = ENV['ELASTIC_SEARCH_URL'] || 'http://localhost:9222'
   
   if ENV['ELASTIC_SEARCH_USER'] && ENV['ELASTIC_SEARCH_PASSWORD']
    config.http_client.options[:user] = ENV['ELASTIC_SEARCH_USER'] 
    config.http_client.options[:password] = ENV['ELASTIC_SEARCH_PASSWORD'] 
   end

   config.flex_models = %w[ Url Product ]
   config.flex_active_models = %w[ Url Product ]
   config.variables[:index] = "url"
end
