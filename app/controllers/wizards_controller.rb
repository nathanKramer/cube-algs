class WizardsController < ApplicationController
  def new
    @wizard = Wizard.new
  end

  def create
    @wizard = Wizard.new(wizard_params)
    if @wizard.save
      redirect_to wizards_path
    else
      render :new
    end
  end

  def index
    @wizards = Wizard.all
  end

  private

  def wizard_params
    params.require(:wizard).permit(:name)
  end
end