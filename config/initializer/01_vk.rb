VkontakteApi.configure do |config|
  config.app_id       = ENV['VK_APP_ID']
  config.app_secret   = ENV['VK_APP_SECRET']
  config.redirect_uri = ''

  config.http_verb = :post
  config.api_version = '5.21'
end