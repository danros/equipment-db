module PageModels
  module Devices
    class Show
      def initialize(device)
        @device = device
      end

      def asset_code
        @device.asset_code.blank? ? '(untagged)' : @device.asset_code
      end

      def category
        if @device.category
          @device.category.name
        else
          '(no category)'
        end
      end

      def delete_device_path
        "/devices/#{@device.id}"
      end

      def edit_device_path
        "/devices/#{@device.id}/edit"
      end

      def has_maintainers?
        maintainers.size > 0
      end

      def has_owners?
        owners.size > 0
      end

      def has_tickets?
        tickets.size > 0
      end

      def maintainers
        @maintainers ||= @device.maintainers.map{|maintainer| {:name => maintainer.name, :delete_path => "/devices/#{@device.id}/maintainers/#{maintainer.id}"}}
      end

      def model
        @device.model
      end

      def name
        @device.name
      end

      def new_maintainer_path
        "/devices/#{@device.id}/maintainers/new"
      end

      def new_owner_path
        "/devices/#{@device.id}/owners/new"
      end

      def new_ticket_path
        "/devices/#{@device.id}/tickets/new"
      end

      def owners
        @owners ||= @device.owners.map{|owner| {:name => owner.name, :delete_path => "/devices/#{@device.id}/owners/#{owner.id}"}}
      end

      def pat_date
        @device.pat_date ? @device.pat_date.to_s : '(not set)'
      end

      def reference_url
        @device.reference_url.blank? ? nil : @device.reference_url
      end

      def reference_url_text
        @device.reference_url.blank? ? '(not set)' : @device.reference_url
      end

      def status
        @device.status ? @device.status.name : '(not set)'
      end

      def tickets
        @tickets ||=
          begin
            open_status = TicketStatus.find_by_name('open')
            open_tickets = @device.tickets.where(:ticket_status_id => open_status.id)
            open_tickets.map do |ticket|
              {
                :summary => ticket.summary,
                :details => ticket.details,
                :timestamp => ticket.created_at.to_s,
                :reported_by => ticket.user.name,
                :update_path => "/devices/#{@device.id}/tickets/#{ticket.id}",
                :invalid_id => invalid_id,
                :resolved_id => resolved_id
              }
            end
          end
      end

      private

      def invalid_id
        @invalid_id ||= TicketStatus.find_by_name('invalid').id
      end

      def resolved_id
        @resolved_id ||= TicketStatus.find_by_name('resolved').id
      end
    end
  end
end
