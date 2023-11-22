# frozen_string_literal: true

class IssuanceRequestsController < ApplicationController
  def index
    request_id = params[:q]

    return if request_id.nil?

    # issuer
    raw_response = Net::HTTP.get(
      URI("#{ENV['ISSUER_URL']}/api/issuance_requests/#{request_id}")
    )
    response = JSON.parse(raw_response)
    @issuer_issuance_request = response['request']

    if @issuer_issuance_request.blank?
      flash[:alert] = 'No request found :('
      return
    end

    @issuer_issuance_transaction = response['transaction']
    @user = response['user']
    @stable_coin = response['stable_coin']
  end
end
