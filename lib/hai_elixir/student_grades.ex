defmodule HaiElixir.StudentGrades do
    @dataFilePath Path.expand("../../data.json",__DIR__)

    def getAll do
        (File.read!(@dataFilePath)
        |> Poison.Parser.parse!)["grades"]
    end
end
