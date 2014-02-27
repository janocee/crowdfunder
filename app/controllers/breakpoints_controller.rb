class BreakpointsController < ApplicationController
  before_filter :load_project

  def new
  	@project = Project.find(params[:project_id])
  	@breakpoint = Breakpoint.new
  end

  def create
  	@project = Project.find(params[:project_id])
  	@breakpoint = @project.breakpoints.build(breakpoint_params)

  	if @breakpoint.save
  		redirect_to project_path(@project), :notice => "Pledge completed!"
  	else
  		render "new"
  	end

  end

  def edit
  	@breakpoint = Breakpoint.find(params[:id])
  end

  def update
  	@breakpoint = Breakpoint.find(params[:id])

  	if @breakpoint.update_attributes(breakpoint_params)
  		redirect_to project_path(@project), :notice => "Updated!"
  	else
  		render :edit
  	end

  end

  def destroy
  	@breakpoint = Breakpoint.find(params[:id])
  	@breakpoint.destroy
  	redirect_to project_path
  end

  private

  def breakpoint_params
  	params.require(:breakpoint).permit(:pledge_amt, :description, :delivery)

  end
end
