# frozen_string_literal: true

module Admin
  # controller for tutorials
  class TutorialsController < Admin::BaseController
    def edit
      @tutorial = Tutorial.find(params[:id])
    end

    def create
      new_tutorial = Tutorial.new(tutorial_params)
      if new_tutorial.save
        redirect_to admin_dashboard_path
      else
        render :new
      end
    end

    def new
      @tutorial = Tutorial.new
    end

    def update
      tutorial = Tutorial.find(params[:id])
      if tutorial.update(tutorial_params)
        flash[:success] = "#{tutorial.title} tagged!"
      end
      redirect_to edit_admin_tutorial_path(tutorial)
    end

    def destroy
      Tutorial.find(params[:id]).destroy
      redirect_to admin_dashboard_path
    end

    private

    def tutorial_params
      params.require(:tutorial).permit(:tag_list, :title, :description)
    end
  end
end
