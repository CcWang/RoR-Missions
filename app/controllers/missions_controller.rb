class MissionsController < ApplicationController
  before_action :require_login
  def index
  end

  def create
    interval = params[:interval_h].to_i*60 + params[:interval_m].to_i
    @mission = Mission.new(title:params[:title],interval:interval,
      times:params[:times],when_start_date:params[:when_start_date],
      when_start_time:params[:when_start_time],check_count:0,alert_count:0,status:"incompleted")
    if !@mission.valid?
      flash[:errors] = @mission.errors.full_messages
      redirect_to :back
      
    else
      @mission.user = current_user
      @mission.save
     
      SchedulersController.new_missison(@mission) 
      redirect_to "/users/#{current_user.id}"
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to :back
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.check_count < @mission.times
      @mission.check_count +=1
      if @mission.check_count >= @mission.times
        @mission.status = true
      end
    end
  
    @mission.save
    # redirect_to "/users/#{current_user.id}"
    redirect_to :back

  end

  def edit
    @mission = Mission.find(params[:id])

  end

  def show
    @mission = Mission.find(params[:id])
  end

  def self.alertCount(mission,c)
    @mission = mission
    @mission.alert_count = c
    @mission.save
  end
# helper_method :get_last
  
end
