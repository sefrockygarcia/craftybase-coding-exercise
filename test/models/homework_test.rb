require 'test_helper'

class HomeworkTest < ActiveSupport::TestCase
  def setup
    @homework_1 = homeworks(:homework_1)
    @homework_2 = homeworks(:homework_2)
  end

  test '.by_title' do
    result = Homework.by_title('Math')
    assert_includes result, @homework_1
    refute_includes result, @homework_2
  end

  test '.submitted_between' do
    result = Homework.submitted_between('2023-04-20 00:00:00', '2023-04-25 00:00:00')
    assert_includes result, @homework_1
    refute_includes result, @homework_2
  end

  test '.by_student_name' do
    result = Homework.by_student_name('Alice Smith')
    assert_includes result, @homework_1
    assert_includes result, @homework_2
  end
end
