# rails-accounts-management-system
open source account management system rails

# Rails 6 Search Forms
https://github.com/activerecord-hackery/ransack

# rails new app
rails new accounting-management-system --database=postgresql

# rails create DB
rails db:create

# Making Controllers and views with scaffold
rails g controller super_admin/admin index show new create edit update destroy

# Model Creation Sample (Auto foreign key and association created)
rails g model Product name:string description:text amount:integer admin:references

# removing columns from table using migration
rails generate migration RemoveAdminIdFromAnimals admin_id:bigint

# add column in table using migration
rails generate migration add_email_to_users email:string