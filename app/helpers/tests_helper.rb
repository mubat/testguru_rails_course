module TestsHelper
  def test_header(test)
    test.new_record? ? 'Добавление нового теста' : "Изменение теста #{@test.title}"
  end
end
