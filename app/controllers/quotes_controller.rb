class QuotesController < ApplicationController
    def create
        p = params[:post]
        @quote = Quote.new(p)
        @quote.save!
    end
end
