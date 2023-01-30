class FetchDataService
  def get_plan(locations, activities, pace)
    prompt = "Write me a detailed travel iterinary to travel to #{list_destinations(locations)} with #{days_per_destination(locations)}." + (pace.present? ? "The trip should be #{pace} paced " : "") + ( activities.present? ? "and include activities related to #{activities.join(" and ")}." : "")

    response = Openai.fetch_response(prompt)
    response
  end

  def explain_point(prompt, point)
    new_prompt = prompt + "Explain me Day #{point} in more detail."
    response = Openai.fetch_response(new_prompt)
  end

  def list_destinations(locations)
    locations.map{ |loc| loc['destination']}.join(' and ')
  end

  def days_per_destination(locations)
    result = []
    locations.each_with_index { |loc, i| result[i] = [loc['days'], loc['destination']].join(loc['days'].to_i == 1 ? " day in " : " days in ") }
    result.join(' and ')
  end
end
