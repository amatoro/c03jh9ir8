class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to actors_path
    else
      render :new
    end

  end

  # def destroy
  #   @actor = Actor.find(params[:id])
  #   @actor.destroy
  #   redirect_to actors_path
  # end

  private

  def actor_params #Seguridad para que el usuario no pueda enviar más información de la requerida
    params.require(:actor).permit(:name, :bio, :birth_date, :birth_place, :image_url, :alive, :death_date, :death_place)
  end

end
