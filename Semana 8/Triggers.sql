


SELECT * FROM CLIENTE; 

INSERT INTO CLIENTE (RUT, NOMBRE, APELLIDO, EMAIL) values ('18.125.154-2', '  m aR tIn  ', ' p APIcC', 'M PA pic @gmail.com' );
COMMIT;

CREATE OR REPLACE TRIGGER tgr_validacion_datos_cliente
BEFORE INSERT OR UPDATE ON CLIENTE

FOR EACH ROW
BEGIN
    :NEW.NOMBRE := INITCAP(:NEW.nombre );
    :NEW.APELLIDO := INITCAP( :NEW.apellido );
    :NEW.EMAIL := LOWER( :NEW.EMAIL );
END tgr_validacion_datos_cliente;
/