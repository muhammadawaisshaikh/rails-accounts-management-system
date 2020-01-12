module OrderHelper
    def products_for_select
        Product.all.collect { |p|
            if p.stock>0
                [p.product_name, p.id]
            else
                # do nothing
            end
        }
    end

    def vendor_for_select
        Vendor.all.collect { |v| [v.vendor_name, v.id] }
    end
end
