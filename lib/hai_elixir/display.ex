#TODO: make pretty
defmodule HaiElixir.Display do
    @help_msg "\nusage: \n
                --grades   get grades for all students
                --grades <id>  get grades for a single student"

    def display({:ok, :help}), do: IO.puts(@help_msg)
    def display({:ok, data}),do: IO.inspect(data)
    def display({:error, err}),do: IO.puts("Whoops! something went wrong!\n#{err}")
end
