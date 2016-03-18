class WizardsController < ApplicationController
  before_action :find_wizard, only: [:update, :edit]

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
    @wizards = Wizard.all
  end

  # GET /wizards/:id/edit
  def edit
  end

  private

  def find_wizard
    @wizard = Wizard.find(params[:id])
  end

  def wizard_params
    params.require(:wizard).permit(:name)
  end
end