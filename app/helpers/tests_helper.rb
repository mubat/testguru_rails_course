module TestsHelper
  def test_header(test)
    test.new_record? ? t('tests.new.title') : t('tests.edit.title', name: @test.title)
  end
end
