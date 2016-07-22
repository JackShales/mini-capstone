class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end
end
