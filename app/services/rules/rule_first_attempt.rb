class Rules::RuleFirstAttempt < Rules::RuleBase
  def self.passed?(test_passage)
    test_passage.passed? && test_passage.user.tests.where(id: test_passage.test.id).count == 1
  end

  def self.title
    I18n.t('badges.name.first_attempt')
  end
end
