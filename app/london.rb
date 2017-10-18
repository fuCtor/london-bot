module London
  autoload :Www, 'london/www'

  module DB
    autoload :Flat, 'london/db/flat'
    autoload :Report, 'london/db/report'
  end

  module Bot
    autoload :Flat, 'london/bot/vk'
  end
end