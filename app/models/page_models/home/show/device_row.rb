module PageModels
  module Home
    class Show
      class DeviceRow
        def initialize(device)
          @device = device
        end

	def name
	  @device.name
	end 

	def path
          "/devices/#{@device.id}"
	end
	
	def status
 	  '(status)'
	end 

	def tag
	  '(tag)'
	end 
      end
    end
  end
end
