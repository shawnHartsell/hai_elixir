defmodule HaiElixir.Cli do
    use Pipe
    import HaiElixir.StudentGrades
    import HaiElixir.Display

     def run(argv) do
         argv
         |> parse_args
         |> start_task
         |> display
     end

     #TODO: do something with errors?
     def parse_args(argv) do
         parse = OptionParser.parse(argv)
         case parse do
             {[help: _],_,_} -> {:ok, :help}
             {[grades: true],[],[]} -> {:ok, :allStudentGrades}
             {[grades: studentId],[],[]} -> {:ok, String.to_integer(studentId)}
         end
     end

     def start_task({:ok, :help}), do: {:ok, :help}
     def start_task({:ok, data}), do: getGrades(data)
end
