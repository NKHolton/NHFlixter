class CoursesController < ApplicationController
	def index
		@courses = Course.all #loads all the courses in our database
	end	

	def show
		@course = Course.find(params[:id])
	end




end
