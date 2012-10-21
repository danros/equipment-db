class Ticket < ActiveRecord::Base
  belongs_to :device
  belongs_to :user
  belongs_to :ticket_status

  attr_accessible :summary, :details, :user_id, :ticket_status_id
end
