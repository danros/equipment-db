module PageModels
  module Devices
    class Show
      def initialize(device)
        @device = device
      end

      def edit_device_path
        "/devices/#{@device.id}/edit"
      end

      def name
        @device.name
      end

      def reference_url
        @device.reference_url
      end

      def reference_url_text
        @device.reference_url || '(not set)'
      end

      def status
        @device.status ? @device.status.name : '(not set)'
      end

      def tag
        '(tag)'
      end
    end
  end
end
