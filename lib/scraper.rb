require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

    def get_page #wrap the open-uri access inside nokogiri
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    end

    def get_courses #runs #get_page to pull page data, use nokogiri.css('.post') for each post
      self.get_page.css('.post')
    end

    def make_courses #call self.get_courses to get use just the posts, iterate over to assign attributes you our new Course object.
      self.get_courses.each do |post|
        course = Course.new
        course.title = post.css('.post').css('h2').text
        course.description = post.css('.post').css('p').text
        course.schedule = post.css('.post').css('.date').text
    end
    end


    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
