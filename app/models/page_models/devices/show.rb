module PageModels
  module Devices
    class Show
      def initialize(device)
        @device = device
      end

      def reference_url
        'Reference URL'
      end

      def status
        'Status'
      end

      def title
        'Title'
      end
    end
  end
end
