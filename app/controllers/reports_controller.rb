class ReportsController < ApplicationController
  before_action :validate_url, only: [:index]
  
  def index; end

  def create
    @employees = Employee.where(status: true) # Empleados activos

    @employees.each do |employee| # Iteración entre todos los empleados actuvos
      number_employee = params['employee_number'].to_i # Convierte a enteros el numero pasado en los parametros
      if employee.employee_number == number_employee
        if params['commit'] == "check_out"
          insert_check_out(employee)
        else
          report = Report.new

          report.check_in = Time.now
          report.employee_id = employee.id

          report.save
          
          redirect_to root_path
        end

      end

    end

    
  end

  def insert_check_out(employee)
    @reports = Report.where(employee_id: employee.id)
    @reports.each do |report|
      date_report = report.check_in.strftime("%d-%B-%Y")
      date_now = Time.now.strftime("%d-%B-%Y")
      if date_report == date_now
        report.update_attribute :check_out, Time.now
      end

    end
  
    redirect_to check_out_path
  end
end
