module OrderHelper
    def products_for_select
        Product.all.collect { |p| [p.product_name, p.id] }
    end

    def vendor_for_select
        Vendor.all.collect { |v| [v.vendor_name, v.id] }
    end
end
