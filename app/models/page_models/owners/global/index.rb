module PageModels
  module Owners
    module Global
      class Index
        def all_owners
          Owner.find(:all).map{|owner| {:name => owner.name, :email => owner.email, :delete_path => "/owners/#{owner.id}"}}
        end

        def new_owner_path
          "/owners/new"
        end
      end
    end
  end
end
