# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    txid = params[:q]

    return if txid.nil?

    begin
      transaction = Glueby::Internal::RPC.client.getrawtransaction(txid.to_s, 1)
      @transaction_json = JSON.pretty_generate(transaction)
    rescue StandardError
      flash[:alert] = 'No transactions found :('
    end
  end
end
