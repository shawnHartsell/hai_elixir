defmodule StudentGradesTest do
    use ExUnit.Case
    import HaiElixir.StudentGrades

    test "can get all grades" do
        data = getAll()
        assert data
        assert Enum.count(data) > 0
    end
end
