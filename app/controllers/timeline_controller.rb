class TimelineController < ApplicationController
  before_filter :authenticate_user!

  def index
    @baby = current_user.babies.first
    @events = @baby.events.order('happened_at DESC').group_by { |event| event.happened_at.to_date.beginning_of_day }.to_a
    @measurements = @baby.measurements.order('created_at DESC').group_by { |measurement| measurement.created_at.to_date.beginning_of_day }.to_a
  end
end
