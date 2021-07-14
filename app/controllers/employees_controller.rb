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

  end

  def create
    data = params.require(:employee)
    employee = Employee.new
    employee.nameEmployee = data["nameEmployee"]
    employee.emailEmployee = data["emailEmployee"]
    employee.positionEmployee = data["positionEmployee"]
    employee.attendanceDate = data["attendanceDate"]
    employee.administrator_id = 1

    #employee.administrator_id = data["1"]
    #Employee.create(data)
    #.permit(:employeeNumber, :nameEmployee, :emailEmployee, :positionEmployee, :attendanceDate, :administrator_id)
    employee.save

    redirect_to root_path
  end

  def edit

  end
end
