SELECT P.Nombre, P.SalarioxHora FROM dbo.Puesto P

DECLARE @xml XML;
SELECT @xml = BulkColumn
FROM OPENROWSET(BULK 'C:\Users\abarc\OneDrive\Documentos\TEC\2026\Bases I\Tarea Programada 2\datosCarga.XML', SINGLE_BLOB) AS datos;
INSERT INTO Puesto (Nombre, SalarioxHora)
SELECT
	T.datos.value('@Nombre','VARCHAR(128)'),
	T.datos.value('@SalarioxHora','MONEY')
FROM @xml.nodes('/Datos/Puestos/Puesto') AS T(datos)

	