module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then 'info'
      when :error then 'error'
      when :alert then 'warning'
    end
  end

  def system_roles
    [
      ['Master',      0],
      ['Coordinator', 1],
      ['Dispatcher',  2]
    ]
  end
end
