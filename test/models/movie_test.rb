require "test_helper"

class MovieTest < ActiveSupport::TestCase
  describe "validation test" do
    #Arrange
    movie = Movie.new

    #Act
    movie.save

    #Assert
    it "Should not save movie without title" do
      _(movie.errors.attribute_names).must_include(:title)
    end

    it "Should not save movie without year" do
      _(movie.errors.attribute_names).must_include(:year)
    end
    
    it "Should not save movie without genre" do
      _(movie.errors.attribute_names).must_include(:genre)
    end
    
    it "Should not save movie without director" do
      _(movie.errors.attribute_names).must_include(:director)
    end
  
  end
end
