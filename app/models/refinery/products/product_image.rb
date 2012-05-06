require 'dragonfly'

module Refinery
  module Products
    class ProductImage < Refinery::Core::BaseModel
      ::Refinery::Products::Dragonfly.setup!

      self.table_name = 'refinery_product_images'  

      include Images::Validators

      belongs_to :product

      image_accessor :image

      # allows Mass-Assignment
      attr_accessible :id, :image, :image_size
    end
  end
end
