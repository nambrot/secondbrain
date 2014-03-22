Flex::Configuration.configure do |config|
   config.flex_models = %w[ Url Product ]
   config.flex_active_models = %w[ Url Product ]
   config.variables[:index] = "url"
end