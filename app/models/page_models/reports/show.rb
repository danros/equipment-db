module PageModels
  module Reports
    class Show
      def initialize(devices)
        @devices = devices
      end

      def headings
        ['Item', 'Provenance', 'Date Acquired', 'Value When Acquired']
      end

      def rows
        @devices.sort_by(&:name).map{|d| ["#{d.name} (#{d.model})", d.provenance && d.provenance.name, d.date_acquired && d.date_acquired.strftime('%Y-%m-%d'), d.value_when_acquired && d.value_when_acquired.round(2)]}
      end
    end
  end
end
