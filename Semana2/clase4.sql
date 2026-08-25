--caso 2 actividad.
DECLARE
    CURSOR c_reservas_vencidas IS
        SELECT *
        FROM reservas
        WHERE fecha_reserva < SYSDATE;
    
BEGIN
    null;
end;
/

--SEMANA 3 VEREMOS CURSORES COMPLEJOS
