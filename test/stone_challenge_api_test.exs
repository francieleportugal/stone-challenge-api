defmodule StoneChallengeApiTest do
  use ExUnit.Case
  doctest StoneChallengeApi

  test "greets the world" do
    assert StoneChallengeApi.hello() == :world
  end
end
