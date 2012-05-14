class CreateProducts < ActiveRecord::Migration

  def up
    create_table :refinery_products do |t|
      t.string   :title
      t.string   :sku
      t.text     :description
      t.integer  :position

      t.string   :image_mime_type
      t.string   :image_name
      t.integer  :image_size
      t.integer  :image_width
      t.integer  :image_height
      t.string   :image_uid
      t.string   :image_ext

      # 产品类别
      t.integer  :category_id

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/products"})
    end

    drop_table :refinery_products

  end

end
