class PledgesController < ApplicationController
	before_filter :ensure_logged_in

	def create
		# params[:pledge]
		#				[:breakpoint_id]

		p = Pledge.new( pledge_params )
		p.user = current_user

		if p.save

			project = p.breakpoint.project
			respond_to do |format|
				format.html { redirect_to project_path( project ), :notice => "YOU MADE A PLEDGE!" }
				format.json { render json: { pledged: project.pledged} }
			end
		else
			respond_to do |format|
				format.html { render 'projects/index' }
				format.json { }
			end
		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:breakpoint_id)
	end
end
