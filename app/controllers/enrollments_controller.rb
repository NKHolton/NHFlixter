class EnrollmentsController < ApplicationController
	before_action :authenticate_user!

	def create
		current_user.enrollments.create(course: current_course) #current_user = user_id.  This ensures correct data of course_id and user_id gets stored in our database
		redirect_to course_path(current_course) #found course_path via rake routes for course GET, courses controller, show action
	end

	private

	def current_course
		@current_course ||= Course.find(params[:course_id])
	end
end
