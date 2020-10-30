# allow this root session to access X running under specified user
# adds key to local auth file see xauth list

xauth add `xauth -f /home/denisa/.Xauthority  list`
export DISPLAY=":0"
