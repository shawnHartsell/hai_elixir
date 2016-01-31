defmodule HaiElixir.StudentGrades do
    @dataFilePath Path.expand("../../data.json",__DIR__)

    #TODO: wrap the parser so to take erlang style API responses
    #so we can elixir-pipes to short circuit on errors and bubble them out
    def getGrades(:allStudentGrades) do
        File.read(@dataFilePath)
        |> (&(elem(&1,1))).()
        |> Poison.Parser.parse
        |> (&(elem(&1,1))).()
        |> (&({:ok,&1["grades"]})).()
    end

    def getGrades(id) do
        getGrades(:allStudentGrades)
        |> (&(elem(&1,1))).()
        |> Enum.filter(&(&1["id"] == id))
        |> case do
            [] -> nil
            [head | []] -> {:ok, head}
            [_ | _] -> {:error, "Multiple students have an id of #{id}"}
        end
    end
end
