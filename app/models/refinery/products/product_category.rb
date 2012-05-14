module Refinery
  module Products
    class ProductCategory < Refinery::Core::BaseModel

      self.table_name = 'refinery_product_categories'  

      acts_as_tree :order => 'sort ASC, created_at DESC'

      scope :roots, :conditions => 'parent_id is NULL', :order => 'sort ASC, created_at DESC'

      after_create :initial_subtree_ids
      before_validation :update_subtree_ids, :on => :create
      after_update :update_ancestors_subtree_ids
      after_destroy :update_ancestors_subtree_ids
      
      validates_presence_of :name, :code
      validates_uniqueness_of :code

    private

      # 初始化DN, 原理是调用save触发更新时的update_dn生成DN然后保存
      def initial_subtree_ids
	      self.save
      end

      def update_subtree_ids
        self.subtree_ids = get_subtree_ids(self).concat([self.id]).join(',')
      end

      def update_ancestors_subtree_ids
        self.ancestors.each { |ancestor| ancestor.save } if self.ancestors
      end

      def get_subtree_ids node
        ids = []

        if node and node.children
          node.children.each do |cate|
            ids << cate.id
            ids.concat(get_subtree_ids(cate)) if cate.children
          end
        end
        
        return ids
      end
    end
  end
end
