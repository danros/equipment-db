module PageModels
  module Owners
    class New
      def initialize(device_id)
        @device_id = device_id
      end

      def form
        PageModels::Owners::Common::Form.new(@device_id)
      end
    end
  end
end
