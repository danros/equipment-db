module PageModels
  module Maintainers
    class New
      def initialize(device_id)
        @device_id = device_id
      end

      def form
        PageModels::Maintainers::Common::Form.new(@device_id)
      end
    end
  end
end
