class Badges::BadgeBase

  def initialize(test_passage)
    @test_passage = test_passage
    self.class.title = 'base'
  end

  def rule
    raise 'Error! Implement rule check in nested badge'
  end

  def self.title
    raise 'Error! Implement rule\'s title'
  end
end
