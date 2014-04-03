-- se hace un fichero para cada informe, incluye mascara y consulta
-- se puede sacar luego por la impresora el fichero generado informep.dat

set echo off
clear column
clear breaks
clear computes

-- indica el caracter separador en el titulo
set headsep !   

ttitle ' INFORME DE PRUEBA: compras por dni ! Curso 2005'

column dni heading '  CLAVE' format a8 word_wrapped
column numt heading 'Num. Tarjeta' format 999,999,999  word_wrapped
column tienda heading 'LUGAR C' format a8 truncate 
column numf heading 'Factu' format 9999

-- escribe el valor solo cuando es distinto a la linea anterior:
-- rompe por dni, salta 2 lineas, rompe por numt, rompe por tienda  
-- on col1 on col2 on col3 , deben estar 'order by' en la select
-- sintaxis:  break on <nom_columna>|<expr> |row|page | report
-- EJ de <expr>:    substr(nom_colum,1,4)  

break on dni skip 2 on numt on tienda 

-- acumula el importe para cada dni 

compute sum of importe on dni

set linesize 79
-- lo he puesto pequeño para ver el efecto en pantalla:
set pagesize 20   
-- lineas de margen superior:
set newpage 1     


-- fichero donde imprime el resultado de la consulta formateado
--          ATENCION: el disco y directorio debe existir en tu ordenador
spool z:\FBD\informep.dat

-- CONSULTA SQL QUE FORMATEA
-- la funcion to_char transforma una fecha en el formato indicado
select dni,numt,numf,fecha,tienda,importe, 
       to_char(SysDate,'ddth fmMon yyyy') Hoy 
from compras 
order by dni, numt, tienda;

spool off


-------- para que no se quede ese formato para todas las consultas posteriores
set echo on
clear column
clear breaks
clear computes
ttitle off
