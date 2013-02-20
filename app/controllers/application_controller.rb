class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_owns_baby
    @baby = current_user.babies.find_by_id(params[:baby_id] || params[:id])
    redirect_to root_path unless @baby.present?
  end

  def baby_owns_measurement
    @measurement = @baby.measurements.find_by_id(params[:measurement_id] || params[:id])
    redirect_to root_path unless @measurement.present?
  end
end
