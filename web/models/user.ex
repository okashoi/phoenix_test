defmodule HelloPhoenix.User do
  use HelloPhoenix.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @required_fields ~w(name email)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
   model
   |> cast(params, @required_fields, @optional_fields)
   |> validate_length(:name, min: 1, max: 20)
   |> validate_format(:email, ~r/@/)
   |> unique_constraint(:email)
  end
end
