require 'sqlite3'
require 'singleton' 

class PlaywrightDBConnection < SQLite3::Database
    include Singleton 

    def initialize
        super('plays.db')
        self.type_translation = true
        self.results_as_hash = true 
    end 
end 

class Playwright
    attr_accessor :id, :name, :birth_year

    def self.all 
        data = PlaywrightDBConnection.instance.execute('SELECT * FROM playwrights')
        data.map { |datum| Playwright.new(datum) }
    end 

    def self.find_by_name(name) 
        data = PlaywrightDBConnection.instance.execute('SELECT playwrights.name FROM playwrights')
        data.first.each { |k, v| puts v } 
    end 

    def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth_year']  
    end 

    def create
        raise "#{self} already in database" if self.id 

        PlaywrightDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
            INSERT INTO
            playwrights (name, birth_year) 
            VALUES
            (?, ?)
        SQL
     
        self.id = PlaywrightDBConnection.instance.last_insert_row_id 
    end 

    def update
        raise "invalid" unless self.id 
            PlaywrightDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
            UPDATE 
            playwrights
            SET
            (name = ?, birth_year = ?) 
            WHERE
            id = ?
        SQL
    end
    
    
  def get_plays(name)
    # returns all plays written by playwright
    data = PlaywrightDBConnection.instance.execute(
        "SELECT
        plays.title 
        FROM 
        plays
        JOIN playwrights
        ON playwrights.id = plays.playwright_id
        FROM 
        playwrights.name = name"
    )

    data.first.each { |k, v| p v } 
  end 
end 