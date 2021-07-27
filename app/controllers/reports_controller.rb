class ReportsController < ApplicationController
  before_action :validate_url, only: [:index]
  
  def index; end

  def create
    @employees = Employee.where(status: true) # Empleados activos
    number_employee = params['employee_number'].to_i # Convierte a enteros el numero pasado en los parametros
    @employees.each do |employee| # Iteración entre todos los empleados actuvos
      if employee.employee_number == number_employee
        if params['commit'] == "check_out"
          insert_check_out(employee)
        else
          if date_match(employee) == true
            puts "Ya hiciste check in el dia de hoy"
          else
            puts "hola"
            insert_check_in(employee)
          end
          redirect_to root_path
        end
      end
    end
  end



  def insert_check_in employee
    report = Report.new

    report.check_in = Time.now
    report.employee_id = employee.id
  
    report.save

    puts "Check in exitoso"

  end

  def insert_check_out employee
    @reports = Report.where(employee_id: employee.id) # Busca reportes que coincidan con el empleado
    @reports.each do |report| # Itera en todos los reportes que coinciden
      date_report_chec_in = report.check_in.strftime("%d-%B-%Y") # Guarada la fecha de cada reporte en formato dia-mes-año
      date_now = Time.now.strftime("%d-%B-%Y") # Guarda la fecha actual del sistema en dia-mes-año
      if date_report_chec_in == date_now # Valida si la fecha actual coincide con la fecha del reporte
        if report.check_out == nil # Verifica que el campo check out este vacio para poder agragarlo
          report.update_attribute :check_out, Time.now  # Agregar en el campo check out vacio
        else
          puts "Ya hiciste check out"
        end 
      end
    end
  
    redirect_to check_out_path
  end

  def date_match employee
    @reports = Report.where(employee_id: employee.id) # Busca reportes que coincidan con el empleado
    if @reports == nil
      return false
    else
      @reports.each do |report| # Itera en todos los reportes que coinciden
        puts "llego aqui"
        date_report = report.check_in.strftime("%d-%B-%Y") # Guarada la fecha de cada reporte en formato dia-mes-año
        date_now = Time.now.strftime("%d-%B-%Y") # Guarda la fecha actual del sistema en dia-mes-año 
        if date_report == date_now # Valida si la fecha actual coincide con la fecha del reporte
          return true
        else
          return false
        end
      end   
    end
   
  end

end
