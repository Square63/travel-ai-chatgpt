class Openai
  MODEL = "text-davinci-003"
  TEMPERATURE = 0.3
  MAX_TOKENS = 500
  TOP_P = 1.0
  FREQUENCY_PENALTY = 0.0
  PRESENCE_PENALTY = 0.0

  def self.fetch_response(prompt)
    response = HTTParty.post(
      ENV['DEFAULT_URL'],
      body: query_object(prompt),
      headers: headers()
    )

    response['choices']&.first['text']
  end

  def self.headers
    {
      "Authorization": "Bearer #{ENV['OPENAI_API_KEY']}",
      "Content-Type": "application/json"
    }
  end

  def self.query_object(prompt)
    {
      "model": MODEL,
      "prompt": prompt,
      "temperature": TEMPERATURE,
      "max_tokens": MAX_TOKENS,
      "top_p": TOP_P,
      "frequency_penalty": FREQUENCY_PENALTY,
      "presence_penalty": PRESENCE_PENALTY
    }.to_json
  end
end
