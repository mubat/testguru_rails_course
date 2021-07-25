class BadgesService
  RULES = [
    Rules::RuleFirstAttempt,
    Rules::RuleCategory,
    Rules::RuleLevel
  ].freeze

  attr_reader :badges

  def initialize(test_passage)
    @test_passage = test_passage
    @badges = []
    @notifications = []
  end

  def find
    RULES.each_with_index do |rule, index|
      rule_instance = rule.new(@test_passage)
      next unless rule_instance.passed?

      @badges += Badge.where(rule: index).to_a
    end
    self
  end

  def reward
    @test_passage.user.badges << @badges
    self
  end

  def self.list
    list = {}
    RULES.each { |badge_class| list[badge_class.name] = badge_class.title }
    list
  end

  def self.rule_title(rule)
    rule = rule.constantize if rule.is_a?(String)
    rule.title
  end
end
