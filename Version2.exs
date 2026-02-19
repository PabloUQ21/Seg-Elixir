defmodule Util do
  def ingresar_texto(mensaje) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end

defmodule EntradaDatos do
  def main do
    "Ingrese nombre del empleado: "
    |> Util.ingresar_texto()
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

EntradaDatos.main()

