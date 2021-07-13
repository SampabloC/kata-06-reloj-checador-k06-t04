# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Insert data in Administrators table
admin = Administrator.new(nameAdmin: "admin", emailAdmin: "admin@admin.com", password: "1234")
admin.save

# Insert data in Employees table
(1..50).each do |number|
  employee_object = Employee.new(employeeNumber: number, nameEmployee: "employee_#{number}",
                                 emailEmployee: "employee_#{number}@employee.com", positionEmployee: 'worker', attendanceDate: '2021-07-09', administrator_id: 1)
  employee_object.save
end
