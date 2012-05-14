class CreateProductCategories < ActiveRecord::Migration
  def up
    create_table :refinery_product_categories do |t|
      # 分类名称
      t.string  :name,        :null => false, :limit => 50
      # 分类编号
      t.string  :code,        :null => false, :limit => 50
      # 简短描述
      t.string  :description, :default => '', :limit => 200
      # 父分类ID
      t.integer :parent_id
      # 所有子树的ID集合,以逗号分隔
      t.string  :subtree_ids, :default => '', :limit => 100
      # 分类类型(单表继承所用)
      t.string  :type,        :null => false, :limit => 50
      # 排序(升序排列)
      t.integer :sort,        :default => 0

      t.timestamps
    end
  end

  def down
    drop_table :refinery_product_categories
  end
end
