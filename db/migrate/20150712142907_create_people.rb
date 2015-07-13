class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string        :name
      t.string        :position
      t.string        :office
      t.string        :extn
      t.string        :start_date
      t.string        :salary
      t.timestamps
    end

    #Populte DB
    path = Rails.root+ "public"+"people.json"
    file = File.read path
    JSON.parse(file)["data"].each do |row|
      person = Person.create(
        :name => row[0],
        :position => row[1],
        :office => row[2],
        :extn => row[3],
        :start_date => Date.parse(row[4]),
        :salary => row[5]
      )
      puts "#{person.inspect}"
    end

  end

  def self.down
    drop_table :people
  end

end
