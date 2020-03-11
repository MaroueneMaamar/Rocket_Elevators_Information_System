class QuotesController < ApplicationController

    # before_filter :authenticate_user!

    # before_action :authenticate_user!, except: [:index, :show]
    
    # def connection
    #     ActiveRecord::Base.establish_connection("#{Rails.env}_sec").connection
    # end

    def index
        @quote = Quote.all
    end

    def create
        p = params["quotes"].permit!
        puts p
        @quote = Quote.new(p)
        @quote.save!
    end
end
