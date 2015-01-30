module ApplicationHelper
  def create_hours(parameters)
    start_time = parameters[:start_time] ? parameters[:start_time] : 0
    end_time = parameters[:end_time] ? parameters[:end_time] : 24.hours
    increment = parameters[:increment] ? parameters[:increment] : 30.minutes
    Array.new(1 + (end_time - start_time)/increment) do |i|
      (Time.now.midnight + (i*increment) + start_time).strftime("%I:%M %p")
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
end
