defmodule FetchingTest do
  use ExUnit.Case
  doctest Floki

  @html """
  <html>
  <head>
  <title>Test</title>
  </head>
  <body>
    <div class="content">
      <a href="http://google.com" class="js-google js-cool" data-action="lolcats">Google</a>
      <a href="http://elixir-lang.org" class="js-elixir js-cool">Elixir lang</a>
      <a href="http://java.com" class="js-java">Java</a>
    </div>
  </body>
  </html>
  """
  @html_without_links """
  <html>
  <head>
  <title>Test</title>
  </head>
  <body>
    <div class="content">
    </div>
  </body>
  </html>
  """

  test "does find elements" do
    selector = "a"

    assert Floki.find(@html, selector) != []
  end

  test "does not find elements" do
    selector = "a"

    assert Floki.find(@html_without_links, selector) == []
  end

end
