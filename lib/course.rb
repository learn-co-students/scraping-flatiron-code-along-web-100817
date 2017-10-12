class Course

  @@all = []

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  attr_accessor :title, :schedule, :description

  def initialize
    self.class.all << self
  end

end
