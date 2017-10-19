module London
  class Scheduler
    def initialize
      @scheduler = Rufus::Scheduler.new
      @scheduler.in "1s" do
        puts 'Scheduler started'
      end
      @scheduler.cron '30 * * * *' do
        url = 'http://www.setlcity.ru/projects/builds/live/id77/owner148/'
        downloader = ReportDownloader.new url
        fn = downloader.download(File.join(ROOT, 'tmp', 'report.xlsx'))
        report = London::DB::Report.new(fn)
        London::DB::Flat.persist_report(report)
      end
    end
  end
end
