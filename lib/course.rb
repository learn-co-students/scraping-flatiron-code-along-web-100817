class Course
  @@all = []

attr_accessor :schedule, :description, :title

  def initialize()
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

end
