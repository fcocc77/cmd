

# Bumblebee
# Hay que cambiar en el /etc/bumblebee/bumblebee.conf "Driver=nvidia" y
# en /etc/bumblebee/bumblebee.conf poner el id de la tarjeta nvidia "BusID "PCI:01:00:0"
# nota: el Display del bumblebee.conf "VirtualDisplay=:8" no puede tener el mismo numero que la
# pantalla principal (echo $DISPLAY) si no da un error

# vim /etc/default/grub
    # Append the following to the GRUB_CMDLINE_LINUX line:
        # modprobe.blacklist=nouveau
# Instalar driver oficiales para kernel-ml
# -----------------------------