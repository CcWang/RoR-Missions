class Mission < ActiveRecord::Base
  belongs_to :user
  # before_save :default_time
  validates :title,:interval,:times,:when_start_date,:when_start_time, presence:true

  # def self.get_last_mission
  #   mission = current_user.mission.last
  # end
  # def default_time
  #   if when_start_time == nil
  #     when_start_time = Time.zone.now
  #   end
  # end
end
