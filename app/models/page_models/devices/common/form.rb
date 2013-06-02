module PageModels
  module Devices
    module Common
      class Form
      	def self.model_name
	  'Device'
        end

        def action
          '/devices'
        end

	def method
          'post'
	end

        def asset_code
          nil
        end

        def category_id
          -1
        end

        def category_values
          @category_values ||= Category.find(:all).map{|v| [v.name, v.id]} + [['(no category)', -1]]
        end

        def model
          nil
        end

        def name
          nil
        end

        def pat_date
          nil
        end

	def reference_url
          nil
	end

        def status_id
          nil
        end

        def status_values
          @status_values ||= Status.find(:all).map{|v| [v.name, v.id]}
        end

        def training_category_id
          -1
        end

        def training_category_values
          @training_category_values ||= TrainingCategory.find(:all).map{|v| [v.name, v.id]} + [['(no category)', -1]]
        end

        def minor_item?
          nil
        end

        def provenance_id
          -1
        end

        def provenance_values
          @provenance_values ||= Provenance.find(:all).map{|v| [v.name, v.id]} + [['(not recorded)', -1]]
        end

        def date_acquired
          nil
        end

        def value_when_acquired
          nil
        end
      end
    end
  end
end
