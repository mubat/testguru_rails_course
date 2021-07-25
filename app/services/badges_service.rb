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

  def process
    find
    reward
  end

  def find
    Badge.all.each do |badge|
      @badges << badge if badge.rule.constantize.send(:passed?, @test_passage)
    end
  end

  def reward
    @test_passage.user.badges << @badges
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
