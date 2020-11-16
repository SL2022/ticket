defmodule Ticket.HelloTest do
  use ExUnit.Case
  doctest Ticket.Hello

  test "greets the world" do
    assert Ticket.Hello.hello() == :world
  end
end
