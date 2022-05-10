# frozen_string_literal: false

# ReadSocialMediaApiService
class ReadSocialMediaApiService
  def self.call(*args)
    new(*args).call
  end

  def initialize(field_type, field_key)
    @field_type = field_type
    @field_key = field_key
  end

  def call
    fetch_response
  end

  private

  attr_reader :field_type, :field_key

  def fetch_response
    api_url = "#{ENV['API_BASE_URL']}/#{field_type}"
    response = HTTParty.get(api_url, { timeout: 15 })
    action_on(response)
  rescue Timeout::Error
    puts "Error #{e.inspect}"
  end

  def action_on(response)
    case response.code
    when 200
      JSON.parse(response.body).pluck(field_key)
    when 404
      "response #{response.code}"
    when 500...600
      "response #{response.code}"
    else
      'Something went wrong, please try again'
    end
  end
end