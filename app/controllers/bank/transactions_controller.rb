class Bank::TransactionsController < ApplicationController
  before_action :set_bank_transaction, only: %i[ show edit update destroy ]

  # GET /bank/transactions or /bank/transactions.json
  def index
    @bank_transactions = Bank::Transaction.all
  end

  # GET /bank/transactions/1 or /bank/transactions/1.json
  def show
  end

  # GET /bank/transactions/new
  def new
    @bank_transaction = Bank::Transaction.new
  end

  # GET /bank/transactions/1/edit
  def edit
  end

  # POST /bank/transactions or /bank/transactions.json
  def create
    @bank_transaction = Bank::Transaction.new(bank_transaction_params)

    respond_to do |format|
      if @bank_transaction.save
        format.html { redirect_to bank_transaction_url(@bank_transaction), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @bank_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank/transactions/1 or /bank/transactions/1.json
  def update
    respond_to do |format|
      if @bank_transaction.update(bank_transaction_params)
        format.html { redirect_to bank_transaction_url(@bank_transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @bank_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank/transactions/1 or /bank/transactions/1.json
  def destroy
    @bank_transaction.destroy

    respond_to do |format|
      format.html { redirect_to bank_transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_transaction
      @bank_transaction = Bank::Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_transaction_params
      params.require(:bank_transaction).permit(:name, :value, :display_name, :tags)
    end
end
