class TimelineController < ApplicationController
  before_filter :authenticate_user!

  def index
    @baby = current_user.babies.first
    @events = @baby.events.order('happened_at DESC').group_by { |event| event.happened_at.to_date.beginning_of_day }
    @measurements = @baby.measurements.order('happened_at DESC').group_by { |measurement| measurement.happened_at.to_date.beginning_of_day }
    if @measurements.empty? && !@events.empty?
      @days = @events.each { |key, value| @events[key] = { 'events' => value } }
    elsif @events.empty? && !@measurements.empty?
      @days = @measurements.each { |key, value| @measurements[key] = { 'measurements' => value } }
    else
      @days = @events.merge(@measurements) { |key, events, measurements| { 'events' => events, 'measurements' => measurements } }
    end
  end
end
