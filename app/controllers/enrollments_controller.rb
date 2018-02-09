class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: %i[index new create destroy]
  before_action :set_enrollment, only: %i[destroy]

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
    @enrollment.course = @course
  end

  # POST /enrollments
  def create
    @enrollment = Enrollment.new(student_id: enrollment_params[:student_id],
                                 course_id: params[:course_id])

    if @enrollment.save
      redirect_to @course, notice: 'Enrollment was successfully created.'
    else
      render :new
    end
  end

  # DELETE /enrollments/1
  def destroy
    @enrollment.destroy
    redirect_to @course, notice: 'Enrollment was successfully destroyed.'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end
end
