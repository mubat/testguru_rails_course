class Badges::BadgeBase

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def valid
    raise 'Error! Implement rule `valid` in nested badge'
  end

  def self.title
    raise 'Error! Implement rule\'s title'
  end
end
