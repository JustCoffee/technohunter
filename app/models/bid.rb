class Bid < ActiveRecord::Base
	validates :terms, acceptance: true
end
