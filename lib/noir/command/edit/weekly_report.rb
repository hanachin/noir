class Noir::Command::Edit::WeeklyReport < Noir::Base::Command
  @description = 'edit weekly report'

  class << self
    # time utilities

    TimeOfADay = (24 * 60 * 60)
    TimeFormat = '%Y%m%d'

    def end_of_week_separeted separator_day_of_week, week_diff
      check_method_name = "#{separator_day_of_week}?"
      unless Time.instance_methods(false).include?(check_method_name.to_sym)
        raise "a day of week name is incorrect! : #{separator_day_of_week}"
      end

      week_end = Time.now + (week_diff * 7 * TimeOfADay)
      week_end += TimeOfADay
      while !week_end.send(check_method_name)
        week_end += TimeOfADay
      end
      week_end - TimeOfADay
    end

    def begin_of_week_separeted separator_day_of_week, week_diff
      end_of_week_separeted(separator_day_of_week, week_diff) - (6*TimeOfADay)
    end


    # main methods
    def edit_report separator_day_of_week, week_diff=0
      system("vim #{report_name(separator_day_of_week, week_diff)}.txt")
    end

    def report_name separator_day_of_week, week_diff=0
      [begin_of_week_separeted(separator_day_of_week, week_diff).strftime(TimeFormat),
       end_of_week_separeted(separator_day_of_week, week_diff).strftime(TimeFormat)].join('_')
    end
  end
end

require 'noir/command/edit/weekly_report/monday'
require 'noir/command/edit/weekly_report/tuesday'
require 'noir/command/edit/weekly_report/wednesday'
require 'noir/command/edit/weekly_report/thursday'
require 'noir/command/edit/weekly_report/friday'
require 'noir/command/edit/weekly_report/saturday'
require 'noir/command/edit/weekly_report/sunday'
