ffmpeg

ffmpeg -i 	"input.mov" -vcodec prores -f mov -r 59.94  -vf yadif=1   -map_metadata -1 -an  "output.mov"





remove audio:                    -an
soluciona problema de 59.94:    -map_metadata -1
time offset:                    -ss 00:00:00.01
