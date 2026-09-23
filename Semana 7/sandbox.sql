--Insertar Clientes
BEGIN
    Insertar_cliente('14.201.255-7', 'Miguel', 'Sanhueza', 'msanhueza@gmail.com', null);

END;
/



-- BUSCAR PO RLCIENTE POR ID, REGRESSA PARAMETROS DE SALIDA
DECLARE
    v_nombre CLIENTE.NOMBRE%TYPE;
    v_apellido CLIENTE.APELLIDO%TYPE;
    v_email CLIENTE.EMAIL%TYPE;
    v_telefono CLIENTE.TELEFONO%TYPE;
BEGIN
    BUSCAR_CLIENTE_POR_ID(1, v_nombre, v_apellido, v_email, v_telefono);
    dbms_output.put_line('Cliente ' || v_nombre || ' ' || v_apellido || ' Email: ' || v_email || ' Telefono: ' || v_telefono);

END;
/