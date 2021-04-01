defmodule StoneChallengeApi.Server do
  @moduledoc """
  Server to Stone challenge.
  """

  use Plug.Router

  plug :match
  plug :dispatch

  get "/:products/:emails" do
    %{ "emails" => emails, "products" => products } = conn.path_params

    emails_list = String.split(emails, "_")
    total = products
      |> String.split("_")
      |> Enum.chunk_every(3)
      |> Enum.reduce(0, fn [_name, value, quantity], acc ->
        String.to_integer(value) * String.to_integer(quantity) + acc
      end)

    number_of_emails = Enum.count(emails_list)

    individual_value = div(total, number_of_emails)
    reminder = rem(total, number_of_emails)

    result = Enum.reduce(emails_list, %{result: %{}, reminder: reminder}, fn
      email, %{result: %{}, reminder: 0} = acc ->
        put_in(acc, [:result, email], individual_value)
      email, acc ->
        acc = put_in(acc, [:result, email], individual_value + 1)
        put_in(acc, [:reminder], acc[:reminder] - 1)
    end)

    send_resp(conn, 200, "#{inspect(result[:result])}")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
