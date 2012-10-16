module PageModels
  module Maintainers
    module Common
      class Form
        def initialize(device_id)
          @device_id = device_id
        end
        
        def action
          "/devices/#{@device_id}/maintainers"
        end

        def all_users
          User.find(:all).map{|user| {:name => user.name, :value => user.id}}
        end
      end
    end
  end
end
