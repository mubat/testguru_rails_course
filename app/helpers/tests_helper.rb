module TestsHelper
  def test_header(test)
    test.present? ? "Изменение теста #{@test.title}" : 'Добавление нового теста'
  end
end
