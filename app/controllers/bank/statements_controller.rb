class Bank::StatementsController < ApplicationController
  before_action :set_bank_statement, only: %i[ show edit update destroy ]

  # GET /bank/statements or /bank/statements.json
  def index
    @bank_statements = Bank::Statement.all
  end

  # GET /bank/statements/1 or /bank/statements/1.json
  def show
  end

  # GET /bank/statements/new
  def new
    @bank_statement = Bank::Statement.new
  end

  # GET /bank/statements/1/edit
  def edit
  end

  # POST /bank/statements or /bank/statements.json
  def create
    @bank_statement = Bank::Statement.new(bank_statement_params)

    respond_to do |format|
      if @bank_statement.save
        format.html { redirect_to bank_statement_url(@bank_statement), notice: "Statement was successfully created." }
        format.json { render :show, status: :created, location: @bank_statement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank/statements/1 or /bank/statements/1.json
  def update
    respond_to do |format|
      if @bank_statement.update(bank_statement_params)
        format.html { redirect_to bank_statement_url(@bank_statement), notice: "Statement was successfully updated." }
        format.json { render :show, status: :ok, location: @bank_statement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank/statements/1 or /bank/statements/1.json
  def destroy
    @bank_statement.destroy

    respond_to do |format|
      format.html { redirect_to bank_statements_url, notice: "Statement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_statement
      @bank_statement = Bank::Statement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_statement_params
      params.require(:bank_statement).permit(:wallet_id, :closed, :closing_value, :closing_reference)
    end
end
