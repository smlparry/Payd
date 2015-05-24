module Dash
  class TransactionsController < ApplicationController
    before_action :get_transaction, :is_users_transaction, only: [:show, :edit, :update, :destroy]
    def index
      @transactions = current_user.transactions
    end

    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def get_transaction
      begin
        @transaction = Transaction.find(params[:id])
      rescue
        redirect_to dash_home_path, flash: { error: "No such transaction found" }
      end
    end

    def is_users_transaction
      if @transaction.user_id != current_user.id
        redirect_to dash_home_path, flash: { error: "You do not have access to this transaction" }
      end
    end
  end
end
