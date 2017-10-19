module London
  autoload :Www, 'london/www'
  autoload :Scheduler, 'london/scheduler'

  module DB
    autoload :Flat, 'london/db/flat'
    autoload :Report, 'london/db/report'
  end

  module Bot
    autoload :Vk, 'london/bot/vk'
    autoload :Answer, 'london/bot/answer'
  end
end