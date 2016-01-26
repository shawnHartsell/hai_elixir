defmodule CliTest do
    use ExUnit.Case
    import HaiElixir.Cli, only: [parse_args: 1]

    test "can parse help" do
        assert parse_args(["--help","foo"]) == :help
    end

    test "can parse getting all student grades" do
        assert parse_args(["--grades"]) == :allStudentGrades
    end

    test "can parse getting single student grades" do
        assert parse_args(["--grades","1"]) == 1
    end
end
