defmodule Splitmore.Expenses.Expense do
  use Ecto.Schema
  import Ecto.Changeset
  alias Splitmore.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "expenses" do
    field :name, :string
    field :amount, :integer

    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:name, :amount, :user_id])
    |> validate_required([:name, :amount, :user_id])
    |> foreign_key_constraint(:user_id)
  end
end
