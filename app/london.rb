module London
  autoload :Www, 'london/www'
  autoload :Scheduler, 'london/scheduler'

  module DB
    autoload :Flat, 'london/db/flat'
    autoload :Notification, 'london/db/notification'
    autoload :Report, 'london/db/report'
  end

  module Bot
    autoload :Vk, 'london/bot/vk'
    autoload :Answer, 'london/bot/answer'
    autoload :Checker, 'london/bot/checker'
  end
end