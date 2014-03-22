require 'clockwork'
include Clockwork
 
every(2.minutes, 'keep alive') { puts 'keep alive' }
