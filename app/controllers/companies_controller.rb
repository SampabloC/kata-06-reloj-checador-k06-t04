class CompaniesController < ApplicationController
  before_action :validate_url

  def index
    @company = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    company.administrator_id = "1"
    company.save
    redirect_to companies_path
  end

  def edit
    set_companies
  end

  def update
    set_companies
    @company.update(company_params)
    redirect_to companies_path
  end

  def destroy
    set_companies
    @company.destroy

    redirect_to companies_path
  end
  
  private

  def company_params
    params.require(:company).permit(:name_company, :address)
  end

  def set_companies
    @company = Company.find(params[:id])
  end
end
