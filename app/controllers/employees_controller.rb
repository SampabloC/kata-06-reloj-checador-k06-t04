# frozen_string_literal: true

# Controller Class for Employees
class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end
end
