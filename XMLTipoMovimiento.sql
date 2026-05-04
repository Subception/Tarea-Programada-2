SELECT TM.Nombre, TM.TipoAccion FROM dbo.TipoMovimiento TM

DECLARE @xml XML;
SELECT @xml = BulkColumn
FROM OPENROWSET(BULK 'C:\Users\abarc\OneDrive\Documentos\TEC\2026\Bases I\Tarea Programada 2\datosCarga.XML', SINGLE_BLOB) AS datos;
INSERT INTO TipoMovimiento (Nombre, TipoAccion)
SELECT
	T.datos.value('@Nombre','VARCHAR(128)'),
	T.datos.value('@TipoAccion','VARCHAR(128)')
FROM @xml.nodes('/Datos/TiposMovimientos/TipoMovimiento') AS T(datos)