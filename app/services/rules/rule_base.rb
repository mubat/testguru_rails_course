class Rules::RuleBase

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def passed?
    raise 'Error! Implement rule `valid` in nested badge'
  end

  def self.title
    raise 'Error! Implement rule\'s title'
  end
end