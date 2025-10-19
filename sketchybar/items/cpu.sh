 
sketchybar --add item        cpu.percent e          \
           --set cpu.percent label.font="$FONT:Bold:14"   \
                             label=CPU                     \
                             y_offset=3                 \
                             width=50                    \
                             icon.drawing=off              \
                             update_freq=1              \
                             background.padding_right=10   \
                                                           \
           --add graph       cpu.sys e 120             \
           --set cpu.sys     width=80                      \
                             graph.color=$RED              \
                             graph.fill_color=$RED         \
                             label.drawing=off             \
                             icon.drawing=off              \
                             background.padding_right=10   \
                                                           \
           --add graph       cpu.user e 30          \
                             width=80               \
           --set cpu.user    graph.color=$BLUE             \
                             update_freq=1               \
                             label.drawing=off             \
                             icon.drawing=off              \
                             background.padding_right=23   \
                             script="$PLUGIN_DIR/cpu.sh"