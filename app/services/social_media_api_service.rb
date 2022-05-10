# frozen_string_literal: false

# SocialMediaApiService
class SocialMediaApiService
  def self.call
    new.call
  end

  def call
    api_responses
  end

  private

  # api_responses method to get final response for social media api.
  def api_responses
    fields_to_fetch = { twitter: 'tweet', facebook: 'status', instagram: 'picture' }
    response = {}
    fields_to_fetch.each do |field_type, field_key|
      response[field_type] = ReadSocialMediaApiService.call(field_type, field_key)
    end
    response
  end
end