# rails-accounts-management-system
open source account management system rails

# Rails 6 Search forms for your Ruby on Rails application
https://github.com/activerecord-hackery/ransack

# Rails Simple Search
https://medium.com/le-wagon/build-a-simple-search-with-the-simple-form-gem-in-rails-5-b247168282d1

# Squeel write your Active Record queries with fewer strings, and more Ruby
https://github.com/activerecord-hackery/squeel

# rails new app
rails new accounting-management-system --database=postgresql

# rails create DB
rails db:create

# Model Creation - Devise
rails generate devise Admin (after this add columns extra in migration to make model as your needs)

# Model Creation - Rolify
rails g rolify Role Admin (To manage roles)

# Making Views of the Device created model - Device
rails generate devise:views admins

# Making Controllers of the Device created model - Device
rails generate devise:controllers admins

# Model Creation Sample (Auto foreign key and association created)
rails g model Product name:string description:text amount:integer admin:references

# Making Controllers and views with scaffold
rails g controller super_admin/admin index show new create edit update destroy

# Model Creation Sample (Auto foreign key and association created)
rails g model Product name:string description:text amount:integer admin:references

# removing columns from table using migration
rails generate migration RemoveAdminIdFromAnimals admin_id:bigint

# add column in table using migration
rails generate migration add_email_to_users email:string

# update column name - rails g migration UpdateColumnVendors
rename_column :table, :old_column, :new_column

# Joins
@vendors = Vendor.select("*").joins(:products)

# update column type to datetime - rails g migration change_date_string_to_datetime
def change
    remove_column :payments, :date
    add_column :payments, :date, :datetime
end

# simple_form Gem in Rails 5
https://medium.com/le-wagon/build-a-simple-search-with-the-simple-form-gem-in-rails-5-b247168282d1
https://github.com/plataformatec/simple_form