class Rules::RuleLevel < Rules::RuleBase
  def passed?
    all_test_passages = @test_passage.user.test_passages.where(test_id: Test.where(level: @test_passage.test.level))
    all_test_passages.each { |test_passage| return false unless test_passage.passed? }
    true
  end

  def self.title
    I18n.t('badges.name.level_completed')
  end
end
