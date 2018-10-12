class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.includes(:user).page(params[:page]).per(5)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to  :back, alert: 'YNew prototype was unsuccessfully created''  全ての項目記入して'
    end
  end

  def show
  end

  def edit
    # @prototype = Prototype.find(params[:id])
  end

  def update
    if @prototype.update(update_prototype_params)
      redirect_to :root, notice: 'Your prototype infomation was successfully updated'
    else
      render :edit
    end
  end

  def update_prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, captured_images_attributes: [:id, :content, :status, :_destroy])
  end
  
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy if prototype.user_id == current_user.id
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end


  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:id, :content, :status]
      )
  end
end
