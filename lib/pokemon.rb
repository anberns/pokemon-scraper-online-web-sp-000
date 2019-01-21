class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type 
    @db = db
  end
    
  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    db.execute("SELECT name, type FROM (?) WHERE id = (?)", db, id)
    Pokemon.new(id, name, type)
  
end

pikachu_from_db = Pokemon.find(1, @db)