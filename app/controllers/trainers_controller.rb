class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :update, :destroy]

  def index
    @trainers = Trainer.all

    render json: @trainers
  end

  def show
    render json: @trainer
  end

  def create
    @trainer = Trainer.new(trainer_params)

    if @trainer.save
      render json: @trainer, status: :created, location: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @trainer.update(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trainer.destroy
  end

  private
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    def trainer_params
      params.require(:trainer).permit(:name, :gender, :age, :home_region, :status_active, :wins, :losses)
    end
end
