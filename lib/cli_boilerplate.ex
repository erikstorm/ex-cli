defmodule CliBoilerplate do

  def start(_type, _args) do
    Supervisor.start_link([], strategy: :one_for_one)
  end

  # Basic program structure
  def main(args) do
    args |> parse_args |> do_something
  end

  # https://hexdocs.pm/elixir/OptionParser.html
  def parse_args(args) do
    options = OptionParser.parse(args)

    # https://hexdocs.pm/elixir/Kernel.SpecialForms.html#case/2
    # Display help if something wrong is passed
    case options do
      {[variable: variable], _, _} -> [variable]
      {[help: true], _, _} -> :help
      _ -> :help
    end
  end

  # Match your functions with case inside parse_args/1 above
  def do_something([variable]) do
    IO.puts "--variable called with #{variable}"
  end

  # Help/usage instructions
  def do_something(:help) do
    IO.puts """
    Usage:
    Write your own usage instructions here.
    ./cli_boilerplate --variable [something]

    Options:
    --help Show this helper message.

    Description:
    Basic starting point for elixir 1.4 cli apps
    """

    # Close application after help message
    # https://hexdocs.pm/elixir/System.html#halt/1
    System.halt
  end

end
