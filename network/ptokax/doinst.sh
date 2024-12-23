config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    rm $NEW
  fi
}

preserve_perms() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ -e $OLD ]; then
    cp -a $OLD ${NEW}.incoming
    cat $NEW > ${NEW}.incoming
    mv ${NEW}.incoming $NEW
  fi
  config $NEW
}

preserve_perms etc/rc.d/rc.ptokax.new
config etc/ptokax/cfg/BanList.xml.new
config etc/ptokax/cfg/Motd.txt.new
config etc/ptokax/cfg/RegisteredUsers.xml.new
config etc/ptokax/cfg/ReservedNicks.pxt.new
config etc/ptokax/cfg/Scripts.pxt.new
config etc/ptokax/cfg/Settings.pxt.new
