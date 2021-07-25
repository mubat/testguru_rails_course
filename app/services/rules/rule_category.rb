class Rules::RuleCategory < Rules::RuleBase
  def self.passed?(test_passage)
    all_test_passages = test_passage.user.test_passages
                                    .where(test_id: Test.where(category: test_passage.test.category))
    all_test_passages.each { |tp| return false unless tp.passed? }
    true
  end

  def self.title
    I18n.t('badges.name.category_completed')
  end
end
