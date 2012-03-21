# == Schema Information
# Schema version: <timestamp>
#
# Table name: users
#
#  id
#  name
#  email
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :email
end
