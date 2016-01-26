defmodule StudentGradesTest do
    use ExUnit.Case
    import HaiElixir.StudentGrades

    test "can get all grades" do
        data = getAll()
        assert data
        assert Map.has_key?(data,"grades")
    end
end
