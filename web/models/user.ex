defmodule NextApi.User do
  use NextApi.Web, :model
  
  @required_fields ~w(username email)
  @optional_fields ~w(password password_hash)

  schema "users" do
    field :email, :string
    field :username, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :username, :password])
    |> validate_required([:email, :username, :password])
    |> hash_password
  end

  defp hash_password(model) do
    case get_change(model, :password) do
      nil -> model
      password -> put_change(model, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
    end
  end
end
