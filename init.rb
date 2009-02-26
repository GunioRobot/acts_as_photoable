$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'active_record/acts/photoable'
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::Photoable }
