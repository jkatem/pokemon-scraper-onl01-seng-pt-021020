class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, id: nil, db:)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db) 
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        # att_values = db.execute("Select last_insert_rowid() FROM pokemon")[0]
        # Pokemon.new(id: att_values[0], name: att_values[1], type: att_values[2], db: db)        
    end

    # class method with 3 arguments
    # (?, ?) : a placeholder; if interpolate inside sql statement, it becomes a security issue, because then anyone can hack it. 

    def self.find(id, db)
        # sql = <<-SQL
        #     SELECT * FROM pokemon WHERE pokemon.id = id
        # SQL
        # obj = db.execute(sql)[0]
        # Pokemon.new(id: obj[0], name: obj[1], type: obj[2], db: db)
        new_p = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
        binding.pry 
    end

    # find pokemon by ID
    # then create/return a new pokemon object

    # class method with 2 arguments
    # 
end
 