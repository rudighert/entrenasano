module ApplicationHelper
  def create_hours(parameters)
    start_time = parameters[:start_time] ? parameters[:start_time] : 0
    end_time = parameters[:end_time] ? parameters[:end_time] : 24.hours
    increment = parameters[:increment] ? parameters[:increment] : 30.minutes
    Array.new(1 + (end_time - start_time)/increment) do |i|
      format_hour((Time.now.midnight + (i*increment) + start_time))
    end
  end

  def time_now parameters={}
    parameters[:increment] = parameters[:increment].nil? ? 15 : parameters[:increment]
    hour= DateTime.now.strftime("%I")
    minute= DateTime.now.strftime("%M")
    minute = (minute.to_i/parameters[:increment])*parameters[:increment]
    pref = DateTime.now.strftime("%p")
    time = "#{hour}:#{minute} #{pref}"
  end

  def format_hour time
    time.strftime("%I:%M %p")
  end

  def class_hours list_class, opts={}
    list_class = list_class.sort_by { |lc| lc[:date_class] }.reverse
    list_hours = []
    list_class.each do |lc|
      list_hours << {
        time: lc.time_class.to_formatted_s(:time),
        date: lc.date_class.strftime('%d/%m/%y'),
        id: lc.id
      }
    end
    max = opts[:max].nil? ? 3 : opts[:max]
    return list_hours[0..max]
  end
end
