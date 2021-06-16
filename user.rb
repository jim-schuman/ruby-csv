class User

  attr_accessor :employee_id, :status_change_date,:birth_date,:user_name,:password,:preferred_last_name,:first_name,:middle_name,:suffix,:last_name,:country_code,:email_address,:hire_date,:status,:manager_id,:manager_status,:department,:gl_code,:location

  def initialize(employee_id, status_change_date,birth_date,user_name,password,preferred_last_name,first_name,middle_name,suffix,last_name,country_code,email_address,hire_date,status,manager_id,manager_status,department,gl_code,location)

    @employee_id = employee_id
    @status_change_date = status_change_date
    @birth_date = birth_date
    @user_name = user_name
    @password = password
    @preferred_last_name = preferred_last_name
    @first_name = first_name
    @middle_name = middle_name
    @suffix = suffix
    @last_name = last_name
    @country_code = country_code
    @email_address = email_address
    @hire_date = hire_date
    @status = status
    @manager_id = manager_id
    @manager_status = manager_status
    @department = department
    @gl_code = gl_code
    @location = location

  end

end