require 'rufus-scheduler'
class SchedulersController < ApplicationController

  def self.new_missison(mission)
    counter = "scheduler"+mission.id.to_s
    counter = Rufus::Scheduler.new
    # puts mission
    # mission= MissionsController.get_last_mission
    interval = mission.interval
    times = mission.times
    c = 1
    # for demo purpose, we use second and mintues to replace mmintues and day
    if interval >0 && mission.
      counter.interval "#{interval}m",:times => times do
        UserMailer.send_mission(mission,c).deliver
        MissionsController.alertCount(mission,c)
        c +=1

      end
    else
      counter.interval "20m",:times => times do
        UserMailer.send_mission(mission,c).deliver
        MissionsController.alertCount(mission,c)
        c +=1
      end
    end
  end
#please test
  def self.destroy(mission)
    counter = "scheduler"+mission.id.to_s
    counter.kill if counter.running?
  end
end
