defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all, do: [
    %Room{
      description: "You can see the light of day. You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit
    },
    %Room{
      description: "You can see an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy
    },
    %Room{
      description: "You found a room with a lot of stuff.",
      actions: [forward(), search()],
      trigger: Enum.random([Triggers.Trap, Triggers.Treasure])
    },
    %Room{
      description: "You found a room with a bed. Looks like a nice place to take a nap.",
      actions: [forward(), rest()],
      trigger: Enum.random([Triggers.EnemyHidden, Triggers.Rest])
    },
  ]
end