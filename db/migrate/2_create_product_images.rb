class CreateProductImages < ActiveRecord::Migration
  def up
    create_table :refinery_product_images do |t|
      t.string   :image_mime_type
      t.string   :image_name
      t.integer  :image_size
      t.integer  :image_width
      t.integer  :image_height
      t.string   :image_uid
      t.string   :image_ext

      t.integer  :position

      t.integer  :product_id

      t.timestamps
    end
  end

  def down
    drop_table :refinery_product_images
  end
end
