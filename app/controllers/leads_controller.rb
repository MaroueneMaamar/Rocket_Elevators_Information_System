class LeadsController < ApplicationController
    def index
        @lead = Lead.all
    end

    def create
        p = params["leads"].permit!
        # puts p
        @lead = Lead.new(p)

        puts 'CURRENT USER'
        pp current_user

        @lead.user = current_user
        @lead.save!
        
        redirect_to message_path
    end
end
