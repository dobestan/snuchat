# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Admin Users
admin_users = [ { name: "dobestan", mysnu: "dobestan", admin: true, active: true, password: "foobar", password_confirmation: "foobar" } ]
admin_users.each do |admin_user|
  User.create(admin_user)
end

demo_users = [ { name: "demo1", mysnu: "demo1", active: true, password: "foobar", password_confirmation: "foobar" },
               { name: "demo2", mysnu: "demo2", active: true, password: "foobar", password_confirmation: "foobar" } ]
demo_users.each do |demo_user|
  User.create(demo_user)
end

