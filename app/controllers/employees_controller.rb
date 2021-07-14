# frozen_string_literal: true

# Controller Class for Employees
class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employees = Employee.new
  end

  def show
    @employees = Employee.find(params[:id])
  end

  def create
    employee = Employee.new(employee_params)
    employee.administrator_id = "1"
    employee.save
    redirect_to employee_path
  end

  def edit
    @employees = Employee.find(params[:id])
  end

  def update
    @employees = Employee.find(params[:id])
    @employees.update(employee_params)
    redirect_to employee_path
  end

  def destroy; end
  
  private

  def employee_params
    params.require(:employee).permit(:employeeNumber, :nameEmployee, :emailEmployee, :positionEmployee, :attendanceDate)#, :administrator_id)
  end


end
