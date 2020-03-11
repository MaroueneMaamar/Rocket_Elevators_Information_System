# class Quote < ApplicationRecord
# end

class Quote < ActiveRecord::Base
    # def connection
    #     ActiveRecord::Base.establish_connection("#{Rails.env}_sec").connection
    # end
    
    # establish_connection "#{Rails.env}_sec"
    # establish_connection("development_sec")
    # ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development_sec'])
end

