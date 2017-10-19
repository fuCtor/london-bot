module London
  autoload :Www, 'london/www'

  module DB
    autoload :Flat, 'london/db/flat'
    autoload :Report, 'london/db/report'
  end

  module Bot
    autoload :Vk, 'london/bot/vk'
    autoload :Answer, 'london/bot/answer'
  end
end