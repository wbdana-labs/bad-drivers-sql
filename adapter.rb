require 'sqlite3'

class Collision

  def self.columns
    {
      state: "TEXT",
      CollisionsBillionMiles: "REAL",
      PercentageSpeeding: "REAL",
      PercentageAlcohol: "REAL",
      PercentageNotDistracted: "REAL",
      PercentageNoPrior: "REAL"
    }
  end

  def self.column_names
    self.columns.keys.map(&:to_s)
  end
  attr_accessor(*self.column_names, :id)

  def self.pluralize_class
    self.to_s.downcase + "s"
  end

  def self.create_table
    string = self.columns.map do |k, v|
      "#{k} #{v}"
    end.join(", ")
    <<-SQL
    CREATE TABLE #{self.pluralize_class} (id INTGER PRIMARY KEY, #{string})
    SQL
  end

  def attribute_values
    Collision.column_names.map do |attribute|
      self.send(attribute)
    end
  end

  def attribute_values_for_sql
    result = attribute_values.map do |attribute_val|
      if attribute_val == true
        1
      elsif attribute_val == false
        0
      else
        attribute_val
      end
    end
    result
  end

  def question_marks
    count = self.class.column_names.keys.size
    ["?"]*count.join(", ")
  end

  




  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def db
    @db ||= SQLite3::Database.new("bad_drivers.db")
  end

  def create_tables
    sql = <<-SQL
    CREATE TABLE insurance (
      id INTEGER PRIMARY KEY,
      State TEXT,
      CarPremiumsDollar REAL,
      InsuranceLossesPerDriver REAL
    );
    CREATE TABLE collisions (
      id INTEGER PRIMARY KEY,
      State TEXT,
      CollisionsBillionMiles REAL,
      PercentageSpeeding REAL,
      PercentageAlcohol REAL,
      PercentageNotDistracted REAL,
      PercentageNoPrior REAL
    );
    SQL
    db.execute(sql)
  end

  def insert_data
    sql = <<-SQL
    INSERT INTO insurance (State, CarPremiumsDollar, InsuranceLossesPerDriver) VALUES
      ("Alabama", 784.55, 145.08),
      ("Alaska", 1053.48, 133.93),
      ("Arizona", 899.47, 110.35),
      ("Arkansas", 827.34, 142.39),
      ("California", 878.41, 165.63),
      ("Colorado", 835.5, 139.91),
      ("Connecticut", 1068.73, 167.02),
      ("Delaware", 1137.87, 151.48),
      ("District of Columbia", 1273.89, 136.05),
      ("Florida", 1160.13, 144.18),
      ("Georgia", 913.15, 142.8),
      ("Hawaii", 861.18, 120.92),
      ("Idaho", 641.96, 82.75),
      ("Illinois", 803.11, 139.15),
      ("Indiana", 710.46, 108.92),
      ("Iowa", 649.06, 114.47),
      ("Kansas", 780.45, 133.8),
      ("Kentucky", 872.51, 137.13),
      ("Louisiana", 1281.55, 194.78),
      ("Maine", 661.88, 96.57),
      ("Maryland", 1048.78, 192.7),
      ("Massachusetts", 1011.14, 135.63),
      ("Michigan", 1110.61, 152.26),
      ("Minnesota", 777.18, 133.35),
      ("Mississippi", 896.07, 155.77),
      ("Missouri", 790.32, 144.45),
      ("Montana", 816.21, 85.15),
      ("Nebraska", 732.28, 114.82),
      ("Nevada", 1029.87, 138.71),
      ("New Hampshire", 746.54, 120.21),
      ("New Jersey", 1301.52, 159.85),
      ("New Mexico", 869.85, 120.75),
      ("New York", 1234.31, 150.01),
      ("North Carolina", 708.24, 127.82),
      ("North Dakota", 688.75, 109.72),
      ("Ohio", 697.73, 133.52),
      ("Oklahoma", 881.51, 178.86),
      ("Oregon", 804.71, 104.61),
      ("Pennsylvania", 905.99, 153.86),
      ("Rhode Island", 1148.99, 148.58),
      ("South Carolina", 858.97, 116.29),
      ("South Dakota", 669.31, 96.87),
      ("Tennessee", 767.91, 155.57),
      ("Texas", 1004.75, 156.83),
      ("Utah", 809.38, 109.48),
      ("Vermont", 716.2, 109.61),
      ("Virginia", 768.95, 153.72),
      ("Washington", 890.03, 111.62),
      ("West Virginia", 992.61, 152.56),
      ("Wisconsin", 670.31, 106.62),
      ("Wyoming", 791.14, 122.04);

    INSERT INTO collisions (State, CollisionsBillionMiles,  PercentageSpeeding,  PercentageAlcohol,  PercentageNotDistracted,  PercentageNoPrior) VALUES
      ("Alabama", 18.8, 39, 30, 96, 80),
      ("Alaska", 18.1, 41, 25, 90, 94),
      ("Arizona", 18.6, 35, 28, 84, 96),
      ("Arkansas", 22.4, 18, 26, 94, 95),
      ("California", 12, 35, 28, 91, 89),
      ("Colorado", 13.6, 37, 28, 79, 95),
      ("Connecticut", 10.8, 46, 36, 87, 82),
      ("Delaware", 16.2, 38, 30, 87, 99),
      ("District of Columbia", 5.9, 34, 27, 100, 100),
      ("Florida", 17.9, 21, 29, 92, 94),
      ("Georgia", 15.6, 19, 25, 95, 93),
      ("Hawaii", 17.5, 54, 41, 82, 87),
      ("Idaho", 15.3, 36, 29, 85, 98),
      ("Illinois", 12.8, 36, 34, 94, 96),
      ("Indiana", 14.5, 25, 29, 95, 95),
      ("Iowa", 15.7, 17, 25, 97, 87),
      ("Kansas", 17.8, 27, 24, 77, 85),
      ("Kentucky", 21.4, 19, 23, 78, 76),
      ("Louisiana", 20.5, 35, 33, 73, 98),
      ("Maine", 15.1, 38, 30, 87, 84),
      ("Maryland", 12.5, 34, 32, 71, 99),
      ("Massachusetts", 8.2, 23, 35, 87, 80),
      ("Michigan", 14.1, 24, 28, 95, 77),
      ("Minnesota", 9.6, 23, 29, 88, 88),
      ("Mississippi", 17.6, 15, 31, 10, 100),
      ("Missouri", 16.1, 43, 34, 92, 84),
      ("Montana", 21.4, 39, 44, 84, 85),
      ("Nebraska", 14.9, 13, 35, 93, 90),
      ("Nevada", 14.7, 37, 32, 95, 99),
      ("New Hampshire", 11.6, 35, 30, 87, 83),
      ("New Jersey", 11.2, 16, 28, 86, 78),
      ("New Mexico", 18.4, 19, 27, 67, 98),
      ("New York", 12.3, 32, 29, 88, 80),
      ("North Carolina", 16.8, 39, 31, 94, 81),
      ("North Dakota", 23.9, 23, 42, 99, 86),
      ("Ohio", 14.1, 28, 34, 99, 82),
      ("Oklahoma", 19.9, 32, 29, 92, 94),
      ("Oregon", 12.8, 33, 26, 67, 90),
      ("Pennsylvania", 18.2, 50, 31, 96, 88),
      ("Rhode Island", 11.1, 34, 38, 92, 79),
      ("South Carolina", 23.9, 38, 41, 96, 81),
      ("South Dakota", 19.4, 31, 33, 98, 86),
      ("Tennessee", 19.5, 21, 29, 82, 81),
      ("Texas", 19.4, 40, 38, 91, 87),
      ("Utah", 11.3, 43, 16, 88, 96),
      ("Vermont", 13.6, 30, 30, 96, 95),
      ("Virginia", 12.7, 19, 27, 87, 88),
      ("Washington", 10.6, 42, 33, 82, 86),
      ("West Virginia", 23.8, 34, 28, 97, 87),
      ("Wisconsin", 13.8, 36, 33, 39, 84),
      ("Wyoming", 17.4, 42, 32, 81, 90);
    SQL
    db.execute(sql)
  end

  def show(id)
  end

  def self.find_by_name(name)
    self.all.find{|state| state.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      state = self.find_by_name(name)
    else
      state = State.new

end
