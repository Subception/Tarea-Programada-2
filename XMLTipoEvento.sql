SELECT TE.Nombre FROM dbo.TipoEvento TE

DECLARE @xml XML;
SELECT @xml = BulkColumn
FROM OPENROWSET(BULK 'C:\Users\abarc\OneDrive\Documentos\TEC\2026\Bases I\Tarea Programada 2\datosCarga.XML', SINGLE_BLOB) AS datos;
INSERT INTO TipoEvento (Nombre)
SELECT
	T.datos.value('@Nombre','VARCHAR(128)')
FROM @xml.nodes('/Datos/TiposEvento/TipoEvento') AS T(datos)