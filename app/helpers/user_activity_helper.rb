module UserActivityHelper
  def message(activity)
    case activity.data_type
      when 0
        "go to (#{activity.info[:type]}) #{activity.info[:path]}"
      when 1
        "sign in at #{activity.info[:time]}"
      when 2
        "sign out at #{activity.info[:time]}"
      when 3
        "set like for picture with id #{activity.info[:id]}"
      when 4
        "set comment '#{activity.info[:text]}' for picture with id #{activity.info[:id]}"
      else
        'Unrecognized type'
    end
  end
end
