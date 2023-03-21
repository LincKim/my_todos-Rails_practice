class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class    #This so that db does not think is a table. 
                            #This is just for inheriting from ActiveRecord
end
