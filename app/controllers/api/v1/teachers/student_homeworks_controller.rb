class Api::V1::Teachers::StudentHomeworksController < ApplicationController
  # GET /api/v1/teachers/:teacher_id/student_homeworks
  def index
    teacher = User.teacher.find(params[:teacher_id])
    homeworks = teacher.homeworks.includes(student_homeworks: :student)

    # Apply filters if any
    if params[:title].present?
      homeworks = homeworks.by_title(params[:title])
    end

    if params[:from].present? && params[:to].present?
      from_date = Date.parse(params[:from])
      to_date = Date.parse(params[:to])
      homeworks = homeworks.submitted_between(from_date, to_date)
    end

    if params[:student_name].present?
      homeworks = homeworks.by_student_name(params[:student_name])
    end

    render json: homeworks.as_json(include: { student_homeworks: { include: :student } }), status: :ok
  end

  # PATCH /api/v1/teachers/:teacher_id/student_homeworks/:id
  def update
    student_homework = StudentHomework.find(params[:id])

    if student_homework.update(grade: params[:grade], note: params[:note], graded_at: Time.now)
      render json: { status: 'success', message: 'Homework graded successfully.' }, status: :ok
    else
      render json: { status: 'error', message: student_homework.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
