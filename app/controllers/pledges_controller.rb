class PledgesController < ApplicationController
	before_filter :ensure_logged_in

	def create
		# params[:pledge]
		#				[:breakpoint_id]

		p = Pledge.new( pledge_params )
		p.user = current_user

		if p.save
			project = p.breakpoint.project
			redirect_to project_path( project ), :notice => "YOU MADE A PLEDGE!"
		else
			render 'projects/index'
		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:breakpoint_id)
	end
end
