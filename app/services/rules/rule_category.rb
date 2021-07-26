class Rules::RuleCategory < Rules::RuleBase
  def self.passed?(test_passage)
    !test_passage.user.test_passages.where(test_id: Test.where(category: test_passage.test.category))
                 .where('passed_percent < ?', TestPassage::PERCENT_TO_PASSED).present?
  end

  def self.title
    I18n.t('badges.name.category_completed')
  end
end
