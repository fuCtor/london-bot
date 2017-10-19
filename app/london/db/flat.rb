module London
  module DB
    class Flat < Sequel::Model
      plugin :timestamps, force: true, update_on_create: true

      def self.persist_report(report)
        report.rows.each do |r|
          flat = self.new r.to_h
          flat.save
        end
      end

      def self.get_by_number(num)
        where(number: num).first
      end

      def diff
        (bti_area - area).round(2)
      end
    end
  end
end