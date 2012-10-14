module PageModels
  module Devices
    module Common
      class Form
      	def self.model_name
	  'Device'
        end

        def action
          @device ? "/devices/#{@device.id}" : '/devices'
        end

        def initialize(device = nil)
          @device = device
        end

        def name
          @device && @device.name
        end

        def status_id
          @device && @device.status_id
        end

        def status_values
          @status_values ||= Status.find(:all).map{|v| [v.name, v.id]}
        end
      end
    end
  end
end
