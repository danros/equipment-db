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

	def method
	  @device ? 'put' : 'post'
	end 

        def asset_code
          @device && @device.asset_code
        end

        def model
          @device && @device.model
        end

        def name
          @device && @device.name
        end

	def reference_url
	  @device && @device.reference_url
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
