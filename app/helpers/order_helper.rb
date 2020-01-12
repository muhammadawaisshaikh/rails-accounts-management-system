module OrderHelper
    def products_for_select
        Product.all.collect { |p| [p.product_name, p.id] }
    end
end
