class QuotesController < ApplicationController
    # before_filter :require_user # require_user will set the current_user in controllers
    # before_filter :set_current_user

    # @quote.user = current_user
    # before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    # before_action :authenticate_user!, except: [:index, :show]

    
    # def connection
    #     ActiveRecord::Base.establish_connection("#{Rails.env}_sec").connection
    # end

    def index
        @quote = Quote.all
    end

    def submissionform
        p current_user
        @userIsLogged = !current_user.nil?
        p @userIsLogged
    end

    # def index
    #     me = current_user
    #     c = User.find(me)
    #     @quote = c.Quote.all
    # end

    # def new
    #     @quote = current_user.quotes.build
    # end

    def show
        @quote = Quote.find params[:id]
    end

    def create
        # @request.email = current_user.email
        # @quote.user = current_user
        p = params["quotes"].permit!
        puts p
        @quote = Quote.new(p)

        puts 'CURRENT USER'
        pp current_user
        # @quote = current_user.Quote.new(p)
        @quote.user = current_user
        @quote.save!
        redirect_to quotesconfirm_path
    end
end
