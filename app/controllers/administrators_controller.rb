# frozen_string_literal: true

# Controller class for Administrator
class AdministratorsController < ApplicationController
  before_action :validate_url, only: [:index]
  
  def index
    @administrators = Administrator.all
  end

  def check; end
end
