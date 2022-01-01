module SongsHelper

  def seconds_to_time(duration)
		minutes = (duration / 60).to_i
    if (minutes > 60)
      hours = (minutes / 60).to_i
      minutes = minutes - (hours*60)
    end
		seconds = duration - (minutes * 60)
		minutes.to_s+":"+seconds.to_s.rjust(2, '0')
	end

  def seconds_to_hour(duration)
		minutes = (duration / 60).to_i
    hours = 0
    if (minutes > 60)
      hours = (minutes / 60).to_i
      minutes = minutes - (hours*60)
    end
		seconds = duration - ((hours * 3600) + (minutes * 60))
		hours.to_s+":"+minutes.to_s.rjust(2, '0')+":"+seconds.to_s.rjust(2, '0')
	end

end
