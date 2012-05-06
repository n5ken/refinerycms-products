require 'dragonfly'

module Refinery
  module Products
    module Dragonfly

      class << self
        def setup!
          app_images = ::Dragonfly[:refinery_images]
          app_images.configure_with(:imagemagick)

          app_images.define_macro(::Refinery::Products::ProductImage, :image_accessor)
          app_images.define_macro(::Refinery::Products::Product, :image_accessor)

          app_images.analyser.register(::Dragonfly::ImageMagick::Analyser)
          app_images.analyser.register(::Dragonfly::Analysis::FileCommandAnalyser)
        end
      end

    end
  end
end
