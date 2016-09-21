class AnalyticsController < ApplicationController
  def index
    @macsbyday = Mac.group_by_day(:created_at).count
  end
end
