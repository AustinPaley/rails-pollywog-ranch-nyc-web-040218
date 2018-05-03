class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy, :metamorphose]

  # add your metamorphose action here

  def index
    @tadpoles = Tadpole.all
  end

  def new
    set_frog
    @tadpole = Tadpole.new
  end

  def show
  end

  def metamorphose
# makes a new frog with the tadpole's name, color, and pond (FAILED - 1)
# deletes the tadpole from the database (FAILED - 2)
# redirects to the newly made frog's show page (FAILED - 3)
    @parent = Frog.find(@tadpole.frog_id)
    @frog = Frog.create(name: @tadpole.name, color: @tadpole.color, pond_id: @parent.pond_id)
    @tadpole.destroy
    redirect_to frog_path(@frog)
  end

  def edit
    @frog = @tadpole.frog
  end

  def update
    respond_to do |format|
      if @tadpole.update(tadpole_params)
        format.html { redirect_to @tadpole, notice: 'Tadpole was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tadpole.destroy
    respond_to do |format|
      format.html { redirect_to tadpoles_url, notice: 'Tadpole was successfully destroyed.' }
    end
  end



  private
    def set_tadpole
      @tadpole = Tadpole.find(params[:id])
    end

    def set_frog
      @frog = Frog.find(params[:frog_id])
    end

    def frog_params
      params.require(:frog).permit(:name, :color, :pond_id)
    end

    def tadpole_params
      params.require(:tadpole).permit(:name, :color, :frog_id)
    end
end
