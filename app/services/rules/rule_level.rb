class Rules::RuleLevel < Rules::RuleBase
  def self.passed?(test_passage)
    !test_passage.user.test_passages.where(test_id: Test.where(level: test_passage.test.level))
                 .where('passed_percent < ?', TestPassage::PERCENT_TO_PASSED).present?
  end

  def self.title
    I18n.t('badges.name.level_completed')
  end
end
