module PageModels
  module Devices
    module Common
      class Form
      	def self.model_name
	  'Device'
        end

        def action
          @device ? "/devices/#{@device.id}" : '/devices'
        end

        def initialize(device = nil)
          @device = device
        end

	def method
	  @device ? 'put' : 'post'
	end

        def asset_code
          @device && @device.asset_code
        end

        def category_id
          (@device && @device.category_id) || -1
        end

        def category_values
          @category_values ||= Category.find(:all).map{|v| [v.name, v.id]} + [['(no category)', -1]]
        end

        def model
          @device && @device.model
        end

        def name
          @device && @device.name
        end

        def pat_date
          @device && @device.pat_date.to_s
        end

	def reference_url
	  @device && @device.reference_url
	end

        def status_id
          @device && @device.status_id
        end

        def status_values
          @status_values ||= Status.find(:all).map{|v| [v.name, v.id]}
        end

        def training_category_id
          (@device && @device.training_category_id) || -1
        end

        def training_category_values
          @training_category_values ||= TrainingCategory.find(:all).map{|v| [v.name, v.id]} + [['(no category)', -1]]
        end

        def minor_item?
          @device && @device.minor_item?
        end

        def provenance_id
          (@device && @device.provenance_id) || -1
        end

        def provenance_values
          @provenance_values ||= Provenance.find(:all).map{|v| [v.name, v.id]} + [['(not recorded)', -1]]
        end

        def date_acquired
          @device && @device.date_acquired
        end

        def value_when_acquired
          @device && @device.value_when_acquired
        end
      end
    end
  end
end
