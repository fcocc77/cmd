
------------------create particiones ------------------------
parted /dev/sda mklabel gpt
parted -a opt /dev/sda mkpart primary ext4 0% 100%
-------------------------------------------------------------


-----------------create_raid_5-----------------------------------------------
mdadm --create /dev/md127 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1
-----------------------------------------------------------------------------


# si es que el md se borra al reiniciar despuede crear el raid poner eso
mdadm --examine --scan --config=mdadm.conf >> /etc/mdadm.conf
#-----------------------------------------------------------

mkfs -t ext4 /dev/md127


"para disco de mas de 2TB formatear el disco en gtp"


----------------expand_raid_5--------------------------
mdadm --add /dev/md127 /dev/sda1
mdadm --grow --raid-devices=4 /dev/md127
-------------------------------------------------------

----------------Force assamble--------------------------
mdadm --assemble --force /dev/md127 /dev/sda /dev/sdb /dev/sdd
-------------------------------------------------------

--------------------check raid-------------
mdadm --detail /dev/md0
-------------------------------------------

------------------remove array-------------------
mdadm --stop /dev/md127
mdadm /dev/md127 --remove /dev/md127
------------------------------------------------