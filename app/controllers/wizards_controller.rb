class WizardsController < ApplicationController
  before_action :find_wizard, only: [:update, :edit, :destroy, :show]
  before_action :search_wizards, only: [:index]

  # GET /wizards/new
  def new
    @wizard = Wizard.new
  end

  # POST /wizards
  def create
    @wizard = Wizard.new(wizard_params)
    if @wizard.save
      redirect_to wizards_path
    else
      render :new
    end
  end

  # PUT /wizards/:id
  def update
    if @wizard.update(wizard_params)
      redirect_to wizards_path
    else
      render :edit
    end
  end

  # GET /wizards
  def index
    respond_to do |format|
      format.html
      format.xml { render xml: @wizards }
      format.json { render json: @wizards }
    end
  end

  # GET /wizards/:id/show
  def show
  end

  # GET /wizards/:id/edit
  def edit
  end

  # DELETE /wizards/:id
  def destroy
    @wizard.destroy
    redirect_to wizards_path
  end

  private

  def find_wizard
    @wizard = Wizard.find(params[:id])
  end

  def search_wizards
    if params[:search]
      @wizards = Wizard.where('LOWER(name) LIKE LOWER(?)', "%#{params[:search]}%")
    else
      @wizards = Wizard.all
    end
  end

  def wizard_params
    params.require(:wizard).permit([:name, :wazatar])
  end
end