class CompaniesController < ApplicationController

    before_action :set_company, only: [:edit, :update] 
    layout "suppliyer" 

    def update
        
    end

    def edit
        
    end

    def suppliyer_panel_company
        @company = current_user.company
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @companies = Company.find(params[:id])
    end
end