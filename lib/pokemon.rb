class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp 
  
  def initialize(id:, name:, type:, db:, hp:60)
    @id = id
    @name = name 
    @type = type 
    @db = db
    @hp = hp
  end
    
  def self.save(name, type, db, hp)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?, ?)",name, type, hp)
  end
  
  def self.find(id, db)
    results = db.execute("SELECT name, type FROM pokemon WHERE id = (?)", id)
    puts results[0][0]
    Pokemon.new(id: id, name: results[0][0], type: results[0][1], db: db)
  end
end

