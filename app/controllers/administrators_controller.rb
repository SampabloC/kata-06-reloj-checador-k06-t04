# frozen_string_literal: true

# Controller class for Administrator
class AdministratorsController < ApplicationController
  def index
    @administrators = Administrator.all
  end

  def manageEmployees; end

  def manageCompany; end

  def report; end
end
