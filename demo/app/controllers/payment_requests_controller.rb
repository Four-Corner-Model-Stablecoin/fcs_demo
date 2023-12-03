# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  def index
    request_id = params[:q]

    return if request_id.nil?

    # issuer
    raw_response = Net::HTTP.get(
      URI("#{ENV['ISSUER_URL']}/api/payment_requests/#{request_id}")
    )
    response = JSON.parse(raw_response)
    @issuer_payment_request = response['request']

    if @issuer_payment_request.blank?
      flash[:alert] = 'No request found :('
      return
    end

    @issuer_payment_transaction = response['transaction']
    @user = response['user']
    @stable_coin = response['stable_coin']
  end

  def new; end
end
