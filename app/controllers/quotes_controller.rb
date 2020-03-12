class QuotesController < ApplicationController
    # before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def index
        @quote = Quote.all
    end

    def submissionform
        p current_user
        @userIsLogged = !current_user.nil?
        p @userIsLogged
    end

    def show
        @quote = Quote.find params[:id]
    end

    def create
        p = params["quotes"].permit!
        # pp p
        @quote = Quote.new(p)

        puts 'CURRENT USER'
        pp current_user
        # @quote = current_user.Quote.new(p)
        @quote.user = current_user
        @quote.save!
        redirect_to quotesconfirm_path
    end
end
