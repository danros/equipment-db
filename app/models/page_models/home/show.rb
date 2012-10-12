module PageModels
  module Home
    class Show
      def initialize(devices)
        @devices = devices
      end

      def device_rows
        @device_rows ||= @devices.map{|device| DeviceRow.new(device)}
      end
    end
  end
end
