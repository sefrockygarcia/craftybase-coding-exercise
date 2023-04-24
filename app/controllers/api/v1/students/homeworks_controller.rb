class Api::V1::Students::HomeworksController < ApplicationController
  # POST /api/v1/students/:student_id/homeworks
  def create
    student = User.student.find(params[:student_id])
    homework = Homework.find(params[:homework_id])

    student_homework = StudentHomework.new(student: student, homework: homework, attachment: params[:attachment], submitted_at: Time.now)

    if student_homework.save
      render json: { status: 'success', message: 'Homework submitted successfully.' }, status: :created
    else
      render json: { status: 'error', message: student_homework.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/students/:student_id/homeworks
  def index
    student = User.student.find(params[:student_id])
    student_homeworks = student.student_homeworks.includes(:homework)

    # Apply filters if provided
    student_homeworks = student_homeworks.by_grade(params[:grade]) if params[:grade].present?
    student_homeworks = student_homeworks.by_title(params[:title]) if params[:title].present?

    render json: student_homeworks.as_json(include: { homework: { only: :title } }), status: :ok
  end
end