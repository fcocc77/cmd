telnet http://192.168.1.254/
user: user
pass: user

# Lista de reglas nat
:nat tmpllist
# -------------

# Borrar regla
:nat tmpldelete index="numero del index de la regla" 
# -------------

# Agregar nueva regla
# http:
    :nat tmpladd group=wan outside_addr=0.0.0.1 inside_addr=172.16.1.64 outside_port=80 inside_port=80
# ftp:
    :nat tmpladd group=wan outside_addr=0.0.0.1 inside_addr=172.16.1.64 outside_port=21 inside_port=21
# ssh:
    :nat tmpladd group=wan outside_addr=0.0.0.1 inside_addr=172.16.1.64 outside_port=22 inside_port=22
# -------------
# Para que funcione el puerto 80 y 21 se debe borrar las reglas que esten asignadas para wan 127.0.0.1