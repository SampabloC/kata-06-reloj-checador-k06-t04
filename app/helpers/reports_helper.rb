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

  def exist_reports_month(report)
    today = Time.now
    date_report = report.check_in
    if today.month == date_report.month && today.year == date_report.year
      report
    end
  end

  def get_report(report)
    exist_reports_today(report)

  end
  def not_reports
    puts "Lo siento no hay reportes aun"
  end

  def average_check_in
    checks_per_mount = 0
    full_hours_check_in = 0

    get_reports().each do |report|

      if report.check_in.month == Time.now.month && report.check_in.year == Time.now.year 
        hours_check_in = report.check_in.strftime('%H').to_f
        minutes_check_in = report.check_in.strftime('%M').to_f

        hours_check_in = hours_check_in + minutes_check_in/60

        full_hours_check_in += hours_check_in
        checks_per_mount += 1
      end
    end
    average_time = average_time(checks_per_mount, full_hours_check_in)

    "#{average_time[:hour]}:#{average_time[:minute]}"
  end

  def average_check_out
    checks_per_mount = 0
    full_hours_check_out = 0
  
    get_reports().each do |report|
  
      if report.check_in.month == Time.now.month && report.check_in.year == Time.now.year 

        if report.check_out != nil

          hours_check_out = report.check_out.strftime('%H').to_f
          minutes_check_out = report.check_out.strftime('%M').to_f
          
          hours_check_out = hours_check_out + minutes_check_out/60
          
          full_hours_check_out += hours_check_out
  
          checks_per_mount += 1
        end
      end
    end

    average_time = average_time(checks_per_mount, full_hours_check_out)
  
    minutes_less_ten(average_time)
  end

  def average_time(checks_per_mounth, full_hours_check)
    floats_check = full_hours_check/checks_per_mounth
    average_hour = floats_check.to_i 
    floats_check = floats_check - average_hour
    average_minutes = floats_check*60  
    average_minutes = average_minutes.to_i
    average = { :hour => average_hour, :minute => average_minutes}
    return average
  end

  def minutes_less_ten(average_time)
    if average_time[:minute] <= 9
      return "#{average_time[:hour]}:0#{average_time[:minute]}" 
    else

      return "#{average_time[:hour]}:#{average_time[:minute]}"
    
    end
  end

end
