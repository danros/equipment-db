module PageModels
  module Categories
    class Index
      def all_categories
        Category.all.map do |category|
          {:name => category.name, :delete_path => "/categories/#{category.id}"}
        end
      end
    end
  end
end
