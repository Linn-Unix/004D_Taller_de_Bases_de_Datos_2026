DROP PROCEDURE Insertar_cliente;

CREATE OR REPLACE PROCEDURE Insertar_cliente(
    p_rut IN VARCHAR2,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_email IN VARCHAR2,
    p_telefono IN VARCHAR2
)
--Las Variables son declaradas despues del AS, y antes del BEGIN 
AS

BEGIN
    INSERT INTO CLIENTE (RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO)VALUES (p_rut, p_nombre,
     p_apellido, p_email, p_telefono);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario Registrado Correctamente.');

END Insertar_cliente;
/


DROP PROCEDURE BUSCAR_CLIENTE_POR_ID;
--Trabajo en Clase:
--crear un procedimiento que retorne los datos de un cliente segun su ID 
CREATE OR REPLACE PROCEDURE BUSCAR_CLIENTE_POR_ID(
    p_cliente_id IN NUMBER,
    p_nombre     OUT VARCHAR2,
    p_apellido   OUT VARCHAR2,
    p_email      OUT VARCHAR2,
    p_telefono   OUT VARCHAR2
) IS
BEGIN
    SELECT NOMBRE, APELLIDO, EMAIL, TELEFONO
    INTO   p_nombre, p_apellido, p_email, p_telefono
    FROM   CLIENTE
    WHERE  CLIENTE_ID = p_cliente_id;

    DBMS_OUTPUT.PUT_LINE('Cliente encontrado: ' || p_nombre || ' ' || p_apellido);
END BUSCAR_CLIENTE_POR_ID;
/