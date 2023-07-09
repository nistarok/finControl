class VariableIncomesController < ApplicationController
  before_action :set_variable_income, only: %i[ show edit update destroy ]

  # GET /variable_incomes or /variable_incomes.json
  def index
    @variable_incomes = VariableIncome.all
  end

  # GET /variable_incomes/1 or /variable_incomes/1.json
  def show
  end

  # GET /variable_incomes/new
  def new
    @variable_income = VariableIncome.new
  end

  # GET /variable_incomes/1/edit
  def edit
  end

  # POST /variable_incomes or /variable_incomes.json
  def create
    @variable_income = VariableIncome.new(variable_income_params)

    respond_to do |format|
      if @variable_income.save
        format.html { redirect_to variable_income_url(@variable_income), notice: "Variable income was successfully created." }
        format.json { render :show, status: :created, location: @variable_income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @variable_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variable_incomes/1 or /variable_incomes/1.json
  def update
    respond_to do |format|
      if @variable_income.update(variable_income_params)
        format.html { redirect_to variable_income_url(@variable_income), notice: "Variable income was successfully updated." }
        format.json { render :show, status: :ok, location: @variable_income }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variable_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variable_incomes/1 or /variable_incomes/1.json
  def destroy
    @variable_income.destroy

    respond_to do |format|
      format.html { redirect_to variable_incomes_url, notice: "Variable income was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variable_income
      @variable_income = VariableIncome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variable_income_params
      params.require(:variable_income).permit(:mode, :name, :value, :trade_date)
    end
end
