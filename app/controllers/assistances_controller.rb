class AssistancesController < ApplicationController
  before_action :set_assistance, only: %i[update destroy]

  # POST /assistances
  def create
    @assistance = Assistance.new
    @assistance.test = Test.find assistance_params[:test_id]
    @assistance.enrollment = Enrollment.find assistance_params[:enrollment_id]
    @assistance.grade = grade

    if @assistance.save
      redirect_to @assistance.course, notice: 'Assistance was successfully created'
    else
      redirect_to @assistance.course, alert: 'There was an error creating the assistance.'
    end
  end

  # PATCH/PUT /assistances/1
  def update
    if @assistance.update(grade: grade)
      redirect_to @assistance.course, notice: 'Assistance was successfully updated.'
    else
      redirect_to @assistance.course, alert: 'There was an error updating the assistance.'
    end
  end

  # DELETE /assistances/1
  def destroy
    course = @assistance.course
    @assistance.destroy
    redirect_to course, notice: 'Assistance was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assistance
    @assistance = Assistance.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assistance_params
    params.require(:assistance).permit(:test_id, :enrollment_id, :grade)
  end

  def grade
    assistance_params[:grade] == '' ? nil : assistance_params[:grade].to_f
  end
end
