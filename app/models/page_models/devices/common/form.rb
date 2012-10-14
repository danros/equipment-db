module PageModels
  module Devices
    module Common
      class Form
        def initialize(device = nil)
          @device = device
        end

        def status_values
          @status_values ||= Status.find(:all).map{|v| [v.name, v.id]}
        end
      end
    end
  end
end
