module PageModels
  module Owners
    module ForDevice
      class New
        def initialize(device_id)
          @device_id = device_id
        end

        def form
          PageModels::Owners::ForDevice::Common::Form.new(@device_id)
        end
      end
    end
  end
end
