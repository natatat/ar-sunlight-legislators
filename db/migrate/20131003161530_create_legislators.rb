require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :state
      t.string :party
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :gender
      t.date :birthdate
      t.string :twitter_id
      t.binary :in_office
      t.timestamps
    end

    create_table :senators do |t|
      t.belongs_to :legislator
    end

    create_table :representatives do |t|
      t.belongs_to :legislator
    end

  end
end

