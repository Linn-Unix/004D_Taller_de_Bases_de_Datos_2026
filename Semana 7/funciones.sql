


--Ejemplo de una funcion:
CREATE OR REPLACE FUNCTION calcular_cuadrado(
    p_numero IN NUMBER

) return NUMBER
AS 
    v_resultado NUMBER;
BEGIN
    v_resultado := p_numero * p_numero;
    RETURN v_resultado;

END;
/


SELECT calcular_cuadrado(15) AS resultado_cuadrado FROM DUAL;

DECLARE
v_resultado NUMBER;
BEGIN
v_resultado := calcular_cuadrado(15);
dbms_output.put_line('El resultado del cuadrado es: ' || v_resultado);

END;
/


--Trabajo en Clase:
--FUNCION APLICAR DESCUENTO en evento SEGUN TABLA CONVENIO_BANCO

CREATE OR REPLACE FUNCTION aplicar_descuento(
    p_monto IN NUMBER,
    p_banco IN VARCHAR2
) RETURN NUMBER
AS
    v_descuento NUMBER := 0;
    v_monto_final NUMBER;
BEGIN
    -- Obtener el descuento según el banco
    SELECT NVL(descuento, 0)                  -- ERROR 1: La columna se llama "descuento_porcentaje", no "descuento" (ORA-00904)
      INTO v_descuento
      FROM convenio_banco
     WHERE convenio_banco_id = p_banco;       -- ERROR 2: Estás comparando el ID numérico contra el nombre del banco ('Banco de Chile') (ORA-01722: invalid number). Debe ser: WHERE banco = p_banco

    -- Calcular el monto final aplicando el descuento
    v_monto_final := p_monto - (p_monto * v_descuento / 100);

    RETURN v_monto_final;

    -- ERROR 3 (Omisión): Falta bloque EXCEPTION. Si el banco no existe, la consulta falla con ORA-01403 (NO_DATA_FOUND)
END;
/

-- Llamada de prueba:
SELECT aplicar_descuento(100000, 'Banco de Chile') AS monto_final FROM DUAL;



--funcion creada por profesor
select * from convenio_banco where convenio_banco_id = 1 AND ACTIVO = 'S';

CREATE OR REPLACE FUNCTION APLICAR_DESCUENTO(
    p_id_banco IN NUMBER,
    p_monto_bruto IN NUMBER
)RETURN NUMBER
IS 
    v_descuento_banco NUMBER;
    v_precio_final NUMBER;

BEGIN
    SELECT DESCUENTO_PORCENTAJE INTO v_descuento_banco FROM CONVENIO_BANCO WHERE CONVENIO_BANCO_ID = p_id_banco AND ACTIVO = 'S';
    
    v_precio_final := p_monto_bruto -  (p_monto_bruto * v_descuento_banco) / 100;

    RETURN v_precio_final;

END aplicar_descuento;
/


SELECT APLICAR_DESCUENTO(1, 10000) AS TOTAL_A_PAGAR FROM DUAL;
 
 DECLARE
 
    v_monto_a_pagar NUMBER;
BEGIN
    v_monto_a_pagar := APLICAR_DESCUENTO(1, 10000);
    dbms_output.put_line('El monto a pagar es: ' || v_monto_a_pagar);
END;
/
