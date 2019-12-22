user="pancho"

# Terminal Color 
theme='PS1="\[\e[0;33m\][\[\e[0;32m\]\u\[\e[0;33m\]@\h:\[\e[0;39m\]\w\[\e[0;33m\]]\$\[\e[0m\] "'
echo $theme > /home/$user/.bashrc
echo  $theme > /root/.bashrc
# -------------------------
# Terminal: ignora mayusculas en el autocomĺetado con el tabulador
echo "\$include /etc/inputrc
set completion-ignore-case on" > /home/$user/.inputrc

echo "\$include /etc/inputrc
set completion-ignore-case on" > /root/.inputrc
# --------------------------------------