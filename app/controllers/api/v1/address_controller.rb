class Api::V1::AddressController < ApplicationController
  before_action :set_address_request

  def index
    if @coordinates
      render json: @coordinates
    else
      render json: { error: "Address missing in request" }
    end
  end

  private

  def set_address_request
    if params[:address].present?
      response = GeocodeFetcher.new(params[:address]).response
      @coordinates = JSON.parse(response.body).first.slice("lat", "lon", "display_name")
    end
  end
end
