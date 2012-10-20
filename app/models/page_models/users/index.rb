module PageModels
  module Users
    class Index
      def all_users
        User.find(:all).map do |user|
          {:name => user.name, :email => user.email, :authorized => user.authorized?, :update_path => "/users/#{user.id}"}
        end
      end
    end
  end
end
