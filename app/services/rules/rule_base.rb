class Rules::RuleBase

  def self.passed?
    raise 'Error! Implement rule `valid` in nested badge'
  end

  def self.title
    raise 'Error! Implement rule\'s title'
  end
end
