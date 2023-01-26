class HomeController < ApplicationController
  before_action :permit_params, only: [:generate_plan]

  def index; end

  def generate_plan
    locations = params.dig('locations').to_a
    activities = params[:activities]
    pace = params[:pace]

    steps, prompt = FetchDataService.new.get_plan(locations, activities, pace)

    puts "\n\n\n#{steps}"

    redirect_to show_path(steps: steps, prompt: prompt)
  end

  def show
    @steps = params[:steps]
    @prompt = params[:prompt]
  end

  def explain_point
    @response = FetchDataService.new.explain_point(params[:prompt], params[:point])
    respond_to do |format|
      format.turbo_stream {  }
    end
  end

  private

  def permit_params
    params.permit(:pace, activities: [], locations: [:destination, :days])
  end

end
