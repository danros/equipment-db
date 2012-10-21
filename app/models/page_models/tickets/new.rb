module PageModels
  module Tickets
    class New
      def initialize(device_id, user_id)
        @device_id = device_id
        @user_id = user_id
      end

      def form
        PageModels::Tickets::Common::Form.new(@device_id, @user_id)
      end
    end
  end
end
