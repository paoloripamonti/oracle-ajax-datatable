class CreatePersonAttributes < ActiveRecord::Migration
  def self.up
    create_table :person_attributes do |t|
      t.string    :column
      t.boolean   :active,    :default=>true
      t.timestamps
    end

    Person.new.attributes.keys.keep_if{|e| !(["created_at","updated_at"].include? e)}.each do |name|
      person_attribute = PersonAttribute.create(:column=>name,:active=>true)
      puts "#{person_attribute.inspect}"
    end

  end

  def self.down
    drop_table :person_attributes
  end

end
