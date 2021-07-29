module ReportsHelper

  def get_reports
    Report.all
  end

  def check_out_exist(report)
    if report.check_out == nil
      report.check_out
    else
      "#{report.check_out.strftime('%d-%B-%Y')}  #{report.check_out.strftime('%R')}" 
    end
  end

  def exist_reports_today(report)
    today_date = Time.now.strftime('%d-%B-%Y')
    date_report = report.check_in.strftime('%d-%B-%Y')
    if today_date == date_report
      report
    end
  end

  def get_report(report)
    exist_reports_today(report)

  end
  def not_reports
    puts "Lo siento no hay reportes aun"
  end


end
