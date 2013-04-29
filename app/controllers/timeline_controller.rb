class TimelineController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = current_user.babies.first.events.order('happened_at DESC').group_by { |event| event.created_at.to_date.beginning_of_day }
    @measurements = current_user.babies.first.measurements.order('created_at DESC').group_by { |measurement| measurement.created_at.to_date.beginning_of_day }
  end
end
