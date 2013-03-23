class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_owns_baby
    @baby = current_user.babies.find_by_id(params[:baby_id] || params[:id])
    
    unless @baby.present?
      flash[:error] = "That's not your baby!"
      redirect_to root_path
    end
  end

  def baby_owns_measurement
    @measurement = @baby.measurements.find_by_id(params[:measurement_id] || params[:id])

    unless @measurement.present?
      flash[:error] = "That's not your baby's measurement!"
      redirect_to root_path
    end
  end

  def baby_owns_event
  	@event = @baby.events.find_by_id(params[:event_id] || params[:id])
  	redirect_to root_path unless @event.present?
  end
end
