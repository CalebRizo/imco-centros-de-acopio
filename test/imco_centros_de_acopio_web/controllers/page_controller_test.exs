defmodule ImcoCentrosDeAcopioWeb.PageControllerTest do
  use ImcoCentrosDeAcopioWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ """
    <!DOCTYPE html>
    <html lang=\"en\">
      <head>
        <meta charset=\"utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"\">

        <title>Hello ImcoCentrosDeAcopio!</title>
      </head>

      <body>
    <div id=\"react-app\"></div>
        <script src=\"/js/app.js\"></script>
      </body>
    </html>
    """
  end
end
