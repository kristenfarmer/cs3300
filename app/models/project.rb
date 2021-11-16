class Project < ApplicationRecord
    #require title and Description 
    validates_presence_of:title, :description
end
