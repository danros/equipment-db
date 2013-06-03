module PageModels
  module Home
    class Show
      class DeviceRow
        def initialize(device)
          @device = device
        end

        def asset_code
          @device.asset_code.blank? ? '(untagged)' : @device.asset_code
        end

	def emphasize_status
          if @device.status && (@device.status.severity > Status::Severity::WARNING)
            true
          else
            false
          end
	end

	def highlight_style
          # Explicit: if no status recorded, return 'nil'
          return nil unless @device.status

          case @device.status.severity
          when Status::Severity::ERROR
            'error'
          when Status::Severity::WARNING
            'warning'
          end
	end

        def model
          @device.model
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

        def training_category
          return '(not set)' unless @device.training_category
          case @device.training_category.name
          when 'Green'
            "<i class=\"icon-ok-circle\" style=\"background-color:\##{training_category_rgb}\"></i> Green</td>"
          when 'Yellow'
            "<i class=\"icon-warning-sign\" style=\"background-color:\##{training_category_rgb}\"></i> Yellow</td>"
          when 'Red'
            "<i class=\"icon-warning-sign\" style=\"background-color:\##{training_category_rgb}\"></i> Red</td>"
          end
        end

        def training_category_rgb
          @device.training_category ? @device.training_category.rgb : 'ffffff'
        end

        def wiki_url
          @device.reference_url
        end
      end
    end
  end
end
