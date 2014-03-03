class ProjectsController < ApplicationController
	before_filter :load_project, :only => [:show, :edit, :update, :destroy]
	before_filter :ensure_ownership, :except => [:index, :show, :new, :create]
	before_filter :ensure_logged_in, :except => [:index, :show]


	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.owner = current_user
		if @project.save
			redirect_to projects_url
		else
			render :new
		end
	end

	def show
		@pledge = Pledge.new
	end

	def edit
	end

	def update

		if @project.update_attributes(project_params)
			redirect_to project_path(@project)
		else
			render :edit
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

	def load_project
		@project = Project.find(params[:id])
	end

	def ensure_ownership
		unless current_user == @project.owner
			flash[:alert] = "You have invalid access to this project!"
			redirect_to projects_path
		end
	end

	def project_params
		params.require(:project).permit(:title, :category, :image, :goal, :description, :pledged, :start_time, :end_time, :user_id)
	end

end
