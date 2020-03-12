# class Quote < ApplicationRecord
# end

class Quote < ActiveRecord::Base
    #cattr_accessor :current_user
    
    # belongs_to :user
    belongs_to :user, optional: true
    #delegate :username, :name, :to => :user
    # delegate :name, to: :user, prefix: true #-> post.user_name
    # def connection
    #     ActiveRecord::Base.establish_connection("#{Rails.env}_sec").connection
    # end
    
    # establish_connection "#{Rails.env}_sec"
    # establish_connection("development_sec")
    # ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development_sec'])
end

