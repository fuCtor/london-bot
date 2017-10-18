module London
  module DB
    class Report
      Item = Struct.new(:section, :flat, :number, :rooms, :area,
                        :bti_section, :bti_flat, :bti_number, :bti_rooms, :bti_area,
                        :completed, :comment) do
        def diff
          (bti_area - area).round(2)
        end
      end

      def initialize(file)
        @file = file
        refresh!
      end

      def refresh!
        @docX = SimpleXlsxReader.open(@file)
        @rows = nil
      end

      def rows
        @rows ||= @docX.sheets.first.rows[4..-1].map do |r|
          Item.new(r[0].to_i,
                   r[1].to_i,
                   r[2].to_i,
                   r[3].to_i,
                   r[4].to_i.round(2),
                   r[5].to_i,
                   r[6].to_i,
                   r[7].to_i,
                   r[8].to_i,
                   r[9].to_f.round(2),
                   !r[10].nil?,
                   r[11].to_s)
        end
      end
    end
  end
end