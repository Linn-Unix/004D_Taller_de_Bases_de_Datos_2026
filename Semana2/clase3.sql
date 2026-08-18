
--clase3
--forma de rellenar un array de forma no procedural
DECLARE
    TYPE numero_asiento IS VARRAY(6) OF VARCHAR2(3);

    v_asiento numero_asiento := numero_asiento('A01', 'A02', 'A03', 'A04', 'A05', 'A06');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se a asignado el asiento N°' || v_asiento(2));
    null;
END;


--crear bloque aonimo declarar VARRAY para guardar 3 ruts
DECLARE
    TYPE rut_usuarios IS VARRAY(3) OF VARCHAR2(12);


    v_rut rut_usuarios := rut_usuarios();

BEGIN
    v_rut.EXTEND;
    v_rut(1) := '12345678-9';
    
    v_rut.EXTEND;
    v_rut(2) := '98765432-1';
    
    v_rut.EXTEND;
    v_rut(3) := '11111111-1';



    DBMS_OUTPUT.PUT_LINE('El rut es N°' || v_rut(1));
    DBMS_OUTPUT.PUT_LINE('El rut es N°' || v_rut(2));
    DBMS_OUTPUT.PUT_LINE('El rut es N°' || v_rut(3));
    
    END;
    /
/