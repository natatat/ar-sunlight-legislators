## CONGRESSMEN CHALLENGE

# importing a csv file into a database
# csv: commas, escape quotations

## ../ar_legislators/lib/sunlight_legislators_importer.rb

require 'csv'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      Senator.create!(row.to_hash)
    end
  end
end

      # s = Senator.new
      # row.each do |key, value|
      #   s.key = value
      # end
      # s.save

# create migration only with the fields we care about
# on line 14: Senator.create(row) will only import the info that fits into the table

# CSV object full of CSV::Row objects

    # puts csv.methods.sort

      # p row => CSV::Row objects
      # p row["firstname"] => all the firstnames!

# $ rake -T => shows all rake commands

## ../ar_legislators/db/migrate

# t.string => 255 characters

def change
  # just use this for now
end

def up
  # instructions of what we want the migration to add
end

def down
  # instructions of how to rollback
end

def change
  remove_column :senators, :fax
  rename_column
end

## ../ar_legislators/models

class Senator < ActiveRecord::Base
  # don't need an initialize...
  # what goes in here? associations, validations...
  belongs_to :alwjglaw # the migration must reflect this!
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  before_save :githubize, :titleize # this is a callback

  def githubize
    # method goes here
  end

end

## ActiveRecord calls! in the application console...

Worker.all.to_sql # => shows sql command
Worker.where # => returns an array of ActiveRecord objects
Worker.where.class # => returns an array of ActiveRecord objects
Worker.find(1) # => returns the ActiveRecord object
Worker.first.update_attribute(:category_id, 4)
Worker.first.reload
Worker.find_or_create_by(name: "bob") # => returns ONE ActiveRecord object (LIMIT 1)
 # wanna check if this entry exists, if not, create it with these attributes
worker = Worker.find_by_name("name") # => returns ONE ActiveRecord object (LIMIT 1)

worker.reload # resaves any changes you make to the database.
reload! # re-syncs database and memory

## ActiveRecord Relation vs. ActiveRecord Model

Worker.where(rating: nil) # => ActiveRecord Relation, can continue chaining other AR methods

# in the model:
scope :without_rating, where(rating: nil)
scope :without_category, where(category_id: nil)
scope :with_category, ->(cat_id) { where(category_id: cat_id) } # scope takes in an argument. lambda

Worker.without_rating.without_category # chaining scopes

