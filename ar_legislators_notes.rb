## CONGRESSMEN CHALLENGE

# importing a csv file into a database
# csv: commas, escape quotations

## ../ar_legislators/lib/sunlight_legislators_importer.rb

require 'csv'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    # puts csv.methods.sort
    csv.each do |row|
      # p row => CSV::Row objects
      # p row["firstname"] => all the firstnames!
      row.each do |field,value|

      end
    end
  end
end

# CSV object full of CSV::Row objects

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