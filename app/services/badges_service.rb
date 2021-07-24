class BadgesService
  RULES = [
    Badges::BadgeFirstAttempt,
    Badges::BadgeLevel,
    Badges::BadgeCategory
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
      next unless rule_instance.valid

      @badges += Badge.where(rule: index).to_a
    end
    self
  end

  def reward
    @test_passage.user.badges << @badges
    self
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
