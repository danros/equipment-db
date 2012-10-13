module PageModels
  module Devices
    class Show
      def initialize(device)
        @device = device
      end

      def name
        @device.name
      end

      def reference_url
        '(reference URL)'
      end

      def status
        '(status)'
      end

      def tag
        '(tag)'
      end 
    end
  end
end
