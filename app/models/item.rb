class Item < ActiveRecord::Base
  belongs_to :belonging

  serialize :details

end
