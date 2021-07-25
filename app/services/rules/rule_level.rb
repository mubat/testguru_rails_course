class Rules::RuleLevel < Rules::RuleBase
  def self.passed?(test_passage)
    all_test_passages = test_passage.user.test_passages.where(test_id: Test.where(level: test_passage.test.level))
    all_test_passages.each { |tp| return false unless tp.passed? }
    true
  end

  def self.title
    I18n.t('badges.name.level_completed')
  end
end
