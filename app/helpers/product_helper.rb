module ProductHelper
    def vendor_for_select
        Vendor.all.collect { |v| [v.vendor_name, v.id] }
    end
end
