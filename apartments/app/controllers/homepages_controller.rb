class HomepagesController < ApplicationController
    before_filter :set_current_user
    
    def index
        @buildings = Building.all
    end    
end
