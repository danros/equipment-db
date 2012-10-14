module PageModels
  module Devices
    class Edit
      def initialize(device)
        @device = device
      end

      def form
        PageModels::Devices::Common::Form.new(@device)
      end
    end
  end
end
