# adapted from http://axlsx.blogspot.com/, https://gist.github.com/2484520
require_relative 'user'
require 'faker'
require 'date'
require 'csv'


# p = Axlsx::Package.new



# Required for use with numbers
# p.use_shared_strings = true

file = "#{Date.today.strftime("%Y%m%d")}.csv"

users = Array.new
5.times do
  birthday_a = Faker::Date.between(from: Date.new(1950,1,1), to: Date.today)
  # birthday = birthday_a.year.to_s + birthday_a.month.to_s + birthday_a.day.to_s
  user = User.new(
    Faker::Number.number(digits: 5),
    "",
    birthday_a.strftime("%Y%m%d"),
    Faker::Internet.username(specifier: 5..8),
    'XXXXXXXXX',
    '',
    Faker::Name.first_name,
    Faker::Name.middle_name,
    Faker::Name.suffix,
    Faker::Name.last_name,
    'USA',
    'XXXXXX@XXXX.com',
    Faker::Date.between(from: '2020-01-23', to: Date.today).strftime("%Y%m%d"),
    'ACTIVE',
    214132,
    'FALSE',
    'Manufacturing',
    '',
    'USA'
  )
  users << user
end

headers = ["EMPLOYEE_ID", "STATUS_CHANGE_DATE", "BIRTH_DATE", "USER_NAME", "PASSWORD", "PREFERRED_FIRST_NAME", "FIRST_NAME", "MIDDLE_NAME", "SUFFIX", "LAST_NAME", "COUNTRY_CODE", "EMAIL_ADDRESS", "HIRE_DATE", "STATUS", "MANAGER_ID", "MANAGER_STATUS", "DEPARTMENT", "GL_CODE", "LOCATION"]

CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
  users.each do |user|
    writer << [
      user.employee_id,
      user.status_change_date,
      user.birth_date,
      user.user_name,
      user.password,
      user.preferred_last_name,
      user.first_name,
      user.middle_name,
      user.suffix,
      user.last_name,
      user.country_code,
      user.email_address,
      user.hire_date,
      user.status,
      user.manager_id,
      user.manager_status,
      user.department,
      user.gl_code,
      user.location
    ]
  end
end


# wb = p.workbook
# wb.add_worksheet(:name => "User Upload") do |sheet|
#   sheet.add_row ["EMPLOYEE_ID", "STATUS_CHANGE_DATE", "BIRTH_DATE", "USER_NAME", "PASSWORD", "PREFERRED_FIRST_NAME", "FIRST_NAME", "MIDDLE_NAME", "SUFFIX", "LAST_NAME", "COUNTRY_CODE", "EMAIL_ADDRESS", "HIRE_DATE", "STATUS", "MANAGER_ID", "MANAGER_STATUS", "DEPARTMENT", "GL_CODE", "LOCATION"]
#   users.each do |user|
#     sheet.add_row [
#                     user.employee_id,
#                     user.status_change_date,
#                     user.birth_date,
#                     user.user_name,
#                     user.password,
#                     user.preferred_last_name,
#                     user.first_name,
#                     user.middle_name,
#                     user.suffix,
#                     user.last_name,
#                     user.country_code,
#                     user.email_address,
#                     user.hire_date,
#                     user.status,
#                     user.manager_id,
#                     user.manager_status,
#                     user.department,
#                     user.gl_code,
#                     user.location
#                   ]
#   end
# end
#
#
# p.serialize "#{filename}.xls"


# %x(excel2csv "#{filename}.xls".xls "C:/Users/JimSchuman/RubymineProjects/mockData/out.csv".csv)
