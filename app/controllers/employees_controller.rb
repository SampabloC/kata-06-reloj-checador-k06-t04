# frozen_string_literal: true

# Controller Class for Employees
class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employees = Employee.new
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
    params.require(:employee).permit(:employeeNumber, :nameEmployee, :emailEmployee, :positionEmployee, :attendanceDate)#, :administrator_id)
  end

  def set_employees
    @employee = Employee.find(params[:id])
  end
  
end
