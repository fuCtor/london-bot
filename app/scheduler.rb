require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '30 * * * *' do

end

scheduler.join