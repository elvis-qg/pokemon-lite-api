class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :update, :destroy]

  # GET /trainers
  def index
    if !params[:pokemon_id]
      @trainers = Trainer.all
    else
      @trainers = Pokemon.find(params[:pokemon_id]).trainers
    end  
    render json: @trainers
  end

  # GET trainers/1
  def show
    render json: @trainer
  end

  # POST /trainers
  def create
    @trainer = Trainer.new(trainer_params)

    if @trainer.save
      render json: @trainer, status: :created, location: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainers/1
  def update
    if @trainer.update(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainers/1
  def destroy
    @trainer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      if !params[:pokemon_id]
        @trainer = Trainer.find(params[:id])
      else  
        @trainer = Pokemon.find(params[:pokemon_id]).trainers.find_by_id(params[:id])
        @trainer = [] if !@trainer
      end
      
    end

    # Only allow a trusted parameter "white list" through.
    def trainer_params
      params.require(:trainer).permit(:name, :gender, :age, :home_region, :status_active, :wins, :losses)
    end
end
