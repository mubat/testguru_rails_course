module BadgeHelper
  ICONS = %w[cup_1.png cup_2.png goal.png medal_1.png medal_2.png success.png].freeze

  def filename(id)
    ICONS[id.is_a?(String) ? id.to_i : id]
  end

  def image(id)
    image_tag(filename(id), class: 'badge-icon')
  end
end
