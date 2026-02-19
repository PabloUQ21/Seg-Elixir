defmodule Util do
  def ingresar(mensaje, :texto) do
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
    |> Util.ingresar(:texto)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

EntradaDatos.main()
