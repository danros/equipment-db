module PageModels
  module Common
    class ConfirmDelete
      attr_reader :delete_path

      def initialize(delete_path)
        @delete_path = delete_path
      end
    end
  end
end
