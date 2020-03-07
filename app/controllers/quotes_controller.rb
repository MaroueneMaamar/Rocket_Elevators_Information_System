class QuotesController < ApplicationController

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
