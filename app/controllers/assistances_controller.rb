class AssistancesController < ApplicationController
  before_action :set_assistance, only: %i[update destroy]

  # POST /assistances
  def create
    @assistance = Assistance.new(assistance_params)

    if @assistance.save
      redirect_to @assistance, notice: 'Assistance was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /assistances/1
  def update
    if @assistance.update(assistance_params)
      redirect_to @assistance, notice: 'Assistance was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assistances/1
  def destroy
    @assistance.destroy
    redirect_to assistances_url, notice: 'Assistance was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assistance
    @assistance = Assistance.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assistance_params
    params.require(:assistance).permit(:test, :enrollment, :grade)
  end
end
