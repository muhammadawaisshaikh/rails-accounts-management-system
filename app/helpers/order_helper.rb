module OrderHelper

    def products_for_select
        Product.all.collect { |p| [p.product_name, p.id] if p.stock>0}.compact
    end

    def vendor_for_select
        Vendor.all.collect { |v| [v.vendor_name, v.id] }
    end
    
end
