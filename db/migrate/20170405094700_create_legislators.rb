require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateLegislators < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :legislators do |t|
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
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
  end
end
