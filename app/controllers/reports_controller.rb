# frozen_string_literal: true

# Clase del controlador de reportes
class ReportsController < ApplicationController
  before_action :validate_url, only: [:index]

  def index; 
    @reports = Report.all
  end

  def create
    @employees = Employee.where(status: true) # Empleados activos
    @employees.each do |employee| # Iteracion entre todos los empleados actuvos
      if employee.id == params['private_number'].to_i
        check_validation(employee)
      end
    end
  end

  def check_validation(employee)
    if params['commit'] == 'Check out'
      insert_check_out(employee)
    else
      if date_match(employee) == true
        flash[:alert] = 'You already Checked In today'
      else
        insert_check_in(employee)
      end
      redirect_to root_path
    end
  end

  def insert_check_in(employee)
    report = Report.new

    report.check_in = Time.now
    report.employee_id = employee.id

    report.save
    flash[:notice] = 'Succesfull Check In'
  end

  def insert_check_out(employee)
    @reports = Report.where(employee_id: employee.id) # Busca reportes que coincidan con el empleado
    @reports.each do |report| # Itera en todos los reportes que coinciden
      date_check_in_report = report.check_in.strftime('%d-%B-%Y')
      date_now = Time.now.strftime('%d-%B-%Y')
      verification_add_check_out(report) if date_check_in_report == date_now
    end
    redirect_to root_path
  end

  def verification_add_check_out(report)
    if report.check_out.nil? # Verifica que el campo check out este vacio para poder agragarlo
      report.update_attribute :check_out, Time.now # Agregar en el campo check out vacio
      flash[:notice] = 'Succesfull Check Out'
    else
      flash[:alert] = 'You already Checked out today'
    end
  end

  def date_match(employee)
    @reports = Report.where(employee_id: employee.id) # Busca reportes que coincidan con el empleado
    if @reports.nil?
      false
    else
      @reports.each do |report| # Itera en todos los reportes que coinciden
        date_report = report.check_in.strftime('%d-%B-%Y') # Guarada la fecha de cada reporte en formato dia-mes-ano
        date_now = Time.now.strftime('%d-%B-%Y') # Guarda la fecha actual del sistema en dia-mes-ano
        return true if date_report == date_now # Valida si la fecha actual coincide con la fecha del reporte
      end
    end
  end

  def get_reports
    return Report.all

  end
end
