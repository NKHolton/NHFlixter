class Instructor::SectionsController < ApplicationController
	before_action :authenticate_user! #makes sure a user is logged in
	before_action :require_authorized_for_current_section #makes sure that that user logged in is the one who created the course

	def new
		@section = Section.new
	end

	def create
    	@section = current_course.sections.create(section_params)
    	redirect_to instructor_course_path(current_course)
  	end

 	private

  	def require_authorized_for_current_section
  		if current_course.user != current_user
  			render text: "Unauthorized", status: :unauthorized
  		end
  	end

  	helper_method :current_course
  	def current_course
  		@current_course ||= Course.find(params[:course_id])
  	end

  	def section_params
    	params.require(:section).permit(:title)
  	end
end
