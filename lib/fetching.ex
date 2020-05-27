defmodule Fetching do

  def fetch(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        assets = body |> Floki.find("img") |> Floki.attribute("src")
        links = body |> Floki.find("a") |> Floki.attribute("href")
        {:ok, assets, links}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found"

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

end
