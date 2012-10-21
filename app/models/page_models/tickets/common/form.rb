module PageModels
  module Tickets
    module Common
      class Form
        attr_reader :user_id
        attr_reader :ticket_status_id

        def initialize(device_id, user_id)
          @device_id = device_id
          @user_id = user_id
          @ticket_status_id = TicketStatus.find_by_name('open').id
        end

        def action
          "/devices/#{@device_id}/tickets"
        end
      end
    end
  end
end
