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

  def new; end

  def create
    json = {
      stable_coin: {
        amount: params[:amount]
      }
    }.to_json
    raw_response = Net::HTTP.post(
      URI("#{ENV['ISSUER_URL']}/stable_coins"),
      json,
      'Content-Type' => 'application/json'
    )
    response = JSON.parse(raw_response.body)
    issuance_request_id = response['request_id']

    flash[:notice] = 'Issue success :)'
    redirect_to issuance_requests_path(q: issuance_request_id)
  end
end
