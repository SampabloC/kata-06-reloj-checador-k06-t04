# frozen_string_literal: true

# Controller Class for Employees
class EmployeesController < ApplicationController
  def index
    @employee = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    employee = Employee.new(employee_params)
    employee.administrator_id = "1"
    employee.save
    redirect_to employees_path
  end

  def edit
    set_employees
  end

  def update
    set_employees
    @employee.update(employee_params)
    redirect_to employees_path
  end

  def destroy
    set_employees
    @employee.destroy

    redirect_to employees_path
  end
  
  private

  def employee_params
    params.require(:employee).permit(:employee_number, :name_employee, :email_employee, :position_employee)#, :administrator_id)
  end

  def set_employees
    @employee = Employee.find(params[:id])
  end
  
end
