defmodule NextApi.Post do
  use NextApi.Web, :model

  schema "posts" do
    field :name, :string
    field :color, :string
    field :size, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :color, :size])
    |> validate_required([:name, :color, :size])
  end
end
