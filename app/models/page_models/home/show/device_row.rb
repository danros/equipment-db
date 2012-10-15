module PageModels
  module Home
    class Show
      class DeviceRow
        def initialize(device)
          @device = device
        end

	def emphasize_status
          if @device.status && (@device.status.severity > StatusSeverity::WARNING)
            true
          else
            false
          end
	end

	def highlight_style
          # Explicit: if no status recorded, return 'nil'
          return nil unless @device.status

          case @device.status.severity
          when StatusSeverity::ERROR
            'error'
          when StatusSeverity::WARNING
            'warning'
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
