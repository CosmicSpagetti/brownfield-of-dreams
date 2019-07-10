class InvitationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    binding.pry
    # params[:username]
    
  end

end
