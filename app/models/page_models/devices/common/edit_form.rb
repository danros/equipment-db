module PageModels
  module Devices
    module Common
      class EditForm < Form
        delegate :asset_code, :model, :name, :reference_url, :status_id, :minor_item?, :date_acquired, :value_when_acquired, :to => :@device

        def initialize(device)
          raise "Cannot create an instance of PageModels::Devices::Common::EditForm with nil Device" if device.nil?
          @device = device
        end

        def action
          "/devices/#{@device.id}"
        end

        def category_id
          @device.category_id || -1
        end

	def method
          'put'
	end

        def pat_date
          @device.pat_date.to_s
        end

        def provenance_id
          @device.provenance_id || -1
        end

        def training_category_id
          @device.training_category_id || -1
        end
      end
    end
  end
end
