require "pry"

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(table)
    @id = table[:id]
    @name = table[:name]
    @type = table[:type]
    @db = table[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES
    (?, ?, ?)", 1, name, type)
  end

  def self.find(id, db)
    new_poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    poke_hash = {}
    poke_hash[:id] = new_poke[0]
    poke_hash[:name] = new_poke[1]
    poke_hash[:type] = new_poke[2]
    poke_hash[:db] = db
    self.new(poke_hash)
  end

end
