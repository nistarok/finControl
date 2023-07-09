class Bank::TransitionsController < ApplicationController
  before_action :set_bank_transition, only: %i[ show edit update destroy ]

  # GET /bank/transitions or /bank/transitions.json
  def index
    @bank_transitions = Bank::Transition.all
  end

  # GET /bank/transitions/1 or /bank/transitions/1.json
  def show
  end

  # GET /bank/transitions/new
  def new
    @bank_transition = Bank::Transition.new
  end

  # GET /bank/transitions/1/edit
  def edit
  end

  # POST /bank/transitions or /bank/transitions.json
  def create
    @bank_transition = Bank::Transition.new(bank_transition_params)

    respond_to do |format|
      if @bank_transition.save
        format.html { redirect_to bank_transition_url(@bank_transition), notice: "Transition was successfully created." }
        format.json { render :show, status: :created, location: @bank_transition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_transition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank/transitions/1 or /bank/transitions/1.json
  def update
    respond_to do |format|
      if @bank_transition.update(bank_transition_params)
        format.html { redirect_to bank_transition_url(@bank_transition), notice: "Transition was successfully updated." }
        format.json { render :show, status: :ok, location: @bank_transition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_transition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank/transitions/1 or /bank/transitions/1.json
  def destroy
    @bank_transition.destroy

    respond_to do |format|
      format.html { redirect_to bank_transitions_url, notice: "Transition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_transition
      @bank_transition = Bank::Transition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_transition_params
      params.require(:bank_transition).permit(:name, :value, :display_name, :origin_id)
    end
end
