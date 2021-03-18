# frozen_string_literal: true

module ShopsHelper
  def hours_generation(open_hours)
    if open_hours.length == 1
      open_hours[0].closed ? t('.closed') : hours_details(open_hours[0])
    else
      text = ''
      open_hours.each do |open_hour|
        text += "#{hours_details(open_hour)}, "
      end
      text[0...-2]
    end
  end

  def hours_details(open_hour)
    "#{open_hour.opens.strftime('%H:%M')}-#{open_hour.closes.strftime('%H:%M')}"
  end
end
