module Refinery
  module Products
    module Admin
      class ProductImagesController < ::Refinery::AdminController

        def destroy
          ProductImage.destroy params[:id]
          redirect_to :back
        end

      end
    end
  end
end
