class BadgesService
  RULES = [
    Badges::BadgeFirstAttempt
  ].freeze

  def self.reward(test_passage)
    RULES.each_with_index do |rule, index|
      rule_instance = rule.new(test_passage)
      test_passage.user.badges << Badge.find_by(rule: index) if rule_instance.valid
    end
  end

  def self.list
    list = []
    RULES.each_with_index do |badge_class, i|
      list[i] = badge_class.title
    end
    list
  end

  def self.title_by_id(id)
    RULES[id].title
  end
end
