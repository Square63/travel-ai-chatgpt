class HomeController < ApplicationController
  protect_from_forgery except: :explain_point
  before_action :permit_params, only: [:generate_plan]

  def index; end

  def generate_plan
    locations = params.dig('locations').to_a
    activities = params[:activities]
    pace = params[:pace]

    @response = FetchDataService.new.get_plan(locations, activities, pace)

    @steps = @response.split(/\n\nDay ([0-9]+):/).reject {|x| x.blank? || x.match?(/\d/)}
    puts @steps
    render :show
  end

  def show
    @steps = []
  end

  def explain_point
    @response = FetchDataService.new.explain_point(params[:prompt], params[:point])
    puts "\n\n#{@response}"
    @point = params[:point]
    @steps = @response.split(/\n\n/)
  end

  private

  def permit_params
    params.permit(:pace, activities: [], locations: [:destination, :days])
  end

end
