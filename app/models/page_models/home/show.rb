module PageModels
  module Home
    class Show
      def initialize(categories, uncategorised_devices)
        @categories = categories
        @uncategorised_devices = uncategorised_devices
      end

      def sections
        return @sections if @sections
        @sections = @categories.map do |category|
          {:name => category.name, :devices => category.devices.find(:all, :order => 'name').map{|device| DeviceRow.new(device)}}
        end
        @sections << {:name => '(No Category)', :devices => @uncategorised_devices.map{|device| DeviceRow.new(device)}}
        @sections
      end
    end
  end
end
