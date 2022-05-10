# frozen_string_literal: false

# SocialMediaApiService
class SocialsController < ApplicationController
  def index
    render json: SocialMediaApiService.call
  end
end
