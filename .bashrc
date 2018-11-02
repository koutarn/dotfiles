# If not running interactively, don't do anything
case $- in
    *i*) exec fish;;
      *) return;;
esac
