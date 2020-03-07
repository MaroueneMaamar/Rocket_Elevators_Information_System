class QuotesController < ApplicationController

    def new_quotes
        p = params["quotes"].permit
        @quotes = Quotes.new(p)
    end
end