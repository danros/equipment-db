module PageModels
  module Home
    class Show
      class DeviceRow
        def initialize(device)
          @device = device
        end

	def emphasize_status
          if @device.status && (@device.status.name == 'Inoperable')
            true
          else
            false
          end
	end

	def highlight_style
          if @device.status && (@device.status.name == 'Inoperable')
            'error'
          elsif @device.status && (@device.status.name == 'Damaged')
            'warning'
          else
            nil
          end
	end

	def name
	  @device.name
	end

	def path
          "/devices/#{@device.id}"
	end

	def status
          @device.status ? @device.status.name : '(not set)'
	end

	def tag
	  '(tag)'
	end
      end
    end
  end
end
