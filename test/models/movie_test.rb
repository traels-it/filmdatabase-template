require "test_helper"

class MovieTest < ActiveSupport::TestCase
  describe "validation test" do
    #Arrange
    movie = Movie.new

    #Act
    movie.save
<<<<<<< HEAD

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
  
=======
    assert movie.errors.attribute_names.include?(:title),
      "Should not save movie without title"
    assert movie.errors.attribute_names.include?(:year),
      "Should not save movie without year"
    assert movie.errors.attribute_names.include?(:genre),
      "Should not save movie without genre"
    assert movie.errors.attribute_names.include?(:director),
      "Should not save movie without director"
>>>>>>> stimulus-implementation
  end
end
