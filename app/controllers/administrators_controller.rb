# frozen_string_literal: true

# Controller class for Administrator
class AdministratorsController < ApplicationController
  def index
    @administrators = Administrator.all
  end

  def manageCompany; end

  def report; end

  def check; end

  def validation; end
end
