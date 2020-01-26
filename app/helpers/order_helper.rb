module OrderHelper
    require 'roo'

    def products_for_select
        Product.all.collect { |p| [p.product_name, p.id] if p.stock>0}.compact
    end

    def vendor_for_select
        Vendor.all.collect { |v| [v.vendor_name, v.id] }
    end

    def read_excel_sheet(path)
        xlsx = Roo::Spreadsheet.open(path)
        xlsx = Roo::Excelx.new(path)

        puts xlsx.info
        # => Returns basic info about the spreadsheet file

        sheet = xlsx.sheet('qwer')
        puts sheet.column(1)
    end
    
end
