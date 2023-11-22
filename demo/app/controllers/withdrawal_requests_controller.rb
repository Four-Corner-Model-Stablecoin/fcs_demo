# frozen_string_literal: true

class WithdrawalRequestsController < ApplicationController
  def index
    request_id = params[:q]

    return if request_id.nil?

    # acquirer
    raw_response = Net::HTTP.get(
      URI("#{ENV['ACQUIRER_URL']}/api/withdrawal_requests/#{request_id}")
    )
    response = JSON.parse(raw_response)
    @acquirer_withdrawal_request = response['request']

    if @acquirer_withdrawal_request.blank?
      flash[:alert] = 'No request found :('
      return
    end

    @acquirer_withdrawal_transaction = response['transaction']
    @merchant = response['merchant']

    # brand
    raw_response = Net::HTTP.get(
      URI("#{ENV['BRAND_URL']}/api/withdrawal_requests/#{request_id}")
    )
    response = JSON.parse(raw_response)
    @brand_withdrawal_request = response['request']
    @brand_withdrawal_transaction = response['transaction']

    # issuer
    raw_response = Net::HTTP.get(
      URI("#{ENV['ISSUER_URL']}/api/withdrawal_requests/#{request_id}")
    )
    response = JSON.parse(raw_response)
    @issuer_withdrawal_request = response['request']
    @issuer_withdrawal_transaction = response['transaction']
    @stable_coin = response['stable_coin']
  end
end
