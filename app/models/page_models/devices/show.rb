module PageModels
  module Devices
    class Show
      def initialize(device)
        @device = device
      end

      def accounting_information
        @accounting_information ||= {
          :minor_item => @device.minor_item?,
          :provenance => @device.provenance && @device.provenance.name,
          :date_acquired => @device.date_acquired,
          :value_when_acquired => @device.value_when_acquired
        }
      end

      def category_and_asset_code
        asset_code = @device.asset_code.blank? ? 'No asset tag' : "Asset #{@device.asset_code}"
        if @device.category
          "#{@device.category.name} / #{asset_code}"
        else
          asset_code
        end
      end

      def well_classes
        if @device.training_category
          "well training-#{@device.training_category.name.downcase}"
        else
          'well'
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
        @device.model.blank? ? 'Not recorded' : @device.model
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

      def training_category
        return 'This equipment doesn\'t yet have any saftey information, which most likely means that it shouldn\'t be used. If you know that this isn\'t the case, please update the equipment database.' unless @device.training_category
        case @device.training_category.name
        when 'Red'
          "This is a <b style=\"color: red\">RED</b> item. An induction session is required before using the equipment for safety reasons and to prevent unnecessary damage."
        when 'Yellow'
          "This is a <b style=\"color: goldenrod\">YELLOW</b> item. An induction session is not required, but is available if you are unsure about how to safely use the equipment. Before use, please make sure you've read the appropriate documentation and are confident that you understand what you're doing."
        when 'Green'
          "This is a <b style=\"color: greed\">GREEN</b> item. It is considered relatively safe and it is difficult to accidentally damage the equipment. However, please use the item carefully and consider the safety of yourself and others. If you are unsure how to do what you would like to do, please ask someone else for help."
        end
      end

      def training_category_rgb
        @device.training_category ? @device.training_category.rgb : 'ffffff'
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
