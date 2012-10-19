module PageModels
  module Owners
    module Common
      class Form
        def initialize(device_id)
          @device_id = device_id
        end
        
        def action
          "/devices/#{@device_id}/owners"
        end

        def all_owners
          Owner.find(:all).map{|owner| {:name => owner.name, :value => owner.id}}
        end
      end
    end
  end
end
