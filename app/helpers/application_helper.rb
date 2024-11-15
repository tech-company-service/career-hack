module ApplicationHelper
  def format_date(date_string)
    return '-' if date_string.blank?

    case date_string.length
    when 4
      "#{date_string}年"
    when 6
      match = date_string.match(/(\d{4})(\d{2})/)
      raise ArgumentError, 'Invalid date format for year and month' unless match

      "#{match[1]}年#{match[2].to_i}月"
    when 8
      match = date_string.match(/(\d{4})(\d{2})(\d{2})/)
      raise ArgumentError, 'Invalid date format for year, month, and day' unless match

      "#{match[1]}年#{match[2].to_i}月#{match[3].to_i}日"
    else
      '-'
    end
  end
end
