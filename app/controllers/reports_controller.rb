class ReportsController < ApplicationController
  before_action :validate_url, only: [:index]
  
  def index; end

  def create
    @employees = Employee.where(status: true) # Empleados activos

    @employees.each do |employee| # Iteración entre todos los empleados actuvos
      number_employee = params['employee_number'].to_i

      if employee.employee_number == number_employee
        report = Report.new

        report.check_in = Time.now
        report.employee_id = employee.id

        report.save
      end
    end

    redirect_to root_path
  end
end
