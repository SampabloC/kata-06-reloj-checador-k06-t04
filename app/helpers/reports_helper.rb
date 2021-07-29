module ReportsHelper

  def report_exist(report)
    if report.check_out == nil
      report.check_out
    else
      "#{report.check_out.strftime('%d-%B-%Y')}  #{report.check_out.strftime('%R')}" 
    end
  end

  
end
