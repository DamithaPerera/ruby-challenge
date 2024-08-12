class CoursesController < ApplicationController
    before_action :set_category
    before_action :set_course, only: %i[show update destroy]
  
    def index
      @courses = @category.courses
      render json: @courses
    end
  
    def show
      render json: @course
    end
  
    def create
      @course = @category.courses.new(course_params)
      if @course.save
        render json: @course, status: :created
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @course.update(course_params)
        render json: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @course.destroy
    end
  
    private
  
    def set_category
      @category = Category.find(params[:category_id])
    end
  
    def set_course
      @course = @category.courses.find(params[:id])
    end
  
    def course_params
      params.require(:course).permit(:name, :author, :state)
    end
end
