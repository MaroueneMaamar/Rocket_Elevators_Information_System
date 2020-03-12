class QuotesController < ApplicationController

    def index
        @quote = Quote.all
    end

    def create
        p = params["quotes"].permit!
        puts p
        @quote = Quote.new(p)
        @quote.save!
        redirect_to quotesconfirm_path
    end
end
