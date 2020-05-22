class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    if !params[:trainer_id]
      @pokemons = Pokemon.all
    else 
      @pokemons = Trainer.find(params[:trainer_id]).pokemons
    end  
    render json: @pokemons
  end

  # GET pokemons/1
  def show
    render json: @pokemon
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      if !params[:trainer_id]
        @pokemon = Pokemon.find(params[:id])
      else  
        @pokemon = Trainer.find(params[:trainer_id]).pokemons.find_by_id(params[:id])
        @pokemon = [] if !@pokemon
      end  
    end

    # Only allow a trusted parameter "white list" through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :base_experience, :main_type, :main_ability)
    end
end
