class Badges::BadgeFirstAttempt < Badges::BadgeBase
  def rule
    TestPassage.find_by(user: @test_passage.user, test: @test_passage.test).nil?
  end

  def self.title
    I18n.t('badges.name.first_attempt')
  end
end
