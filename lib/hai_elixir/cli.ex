defmodule HaiElixir.Cli do
     @moduledoc """
        Handles command line parsing for the app
     """
     def run(argv) do
         argv
         |> parse_args
         |> process
     end

     #TODO: do something with errors
     def parse_args(argv) do
         parse = OptionParser.parse(argv)
         case parse do
             {[help: _],_,_} -> :help
             {[grades: true],[],[]} -> :allStudentGrades
             {[grades: studentId],[],[]} -> String.to_integer(studentId)
         end
     end

     def process(:help) do
         IO.puts """
         usage: \n
         --grades   get grades for all students
         --grades <id>  get grades for a single student
         """
     end

     def process(:allStudentGrades) do

     end

     def process(studentId) do
 
     end
end
