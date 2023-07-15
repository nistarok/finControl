class Bank::AccountsController < ApplicationController
  before_action :set_bank_account, only: %i[ show edit update destroy ]
  before_action :set_wallets, only: %i[new edit]
  # GET /bank/accounts or /bank/accounts.json
  def index
    @bank_accounts = Bank::Account.all
  end

  # GET /bank/accounts/1 or /bank/accounts/1.json
  def show
  end

  # GET /bank/accounts/new
  def new
    @bank_account = Bank::Account.new
  end

  # GET /bank/accounts/1/edit
  def edit
  end

  # POST /bank/accounts or /bank/accounts.json
  def create
    @bank_account = Bank::Account.new(bank_account_params)

    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to bank_account_url(@bank_account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @bank_account }
      else
        @wallet = current_user.wallets.find(bank_account_params[:wallet_id])
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank/accounts/1 or /bank/accounts/1.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to bank_account_url(@bank_account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank/accounts/1 or /bank/accounts/1.json
  def destroy
    @bank_account.destroy

    respond_to do |format|
      format.html { redirect_to bank_accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = Bank::Account.find(params[:id])
    end

    def set_wallets
      @wallet = current_user.wallets.find(params[:wallet_id]) rescue nil
      @wallets = current_user.wallets
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.require(:bank_account).permit(:balance, :name, :description, :wallet_id)
    end
end
