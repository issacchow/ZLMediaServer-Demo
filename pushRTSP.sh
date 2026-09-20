host=172.16.136.84:8800
# 公司网络原因，不能使用外网ip推送
#host=183.6.152.75:8080  

target_url="rtsp://$host/live/test_stream/great-wall?username=123"

echo "push rtsp url:$target_url"

docker run --rm -v ./media:/media:ro linuxserver/ffmpeg \
-re \
-stream_loop 20 \
-i /media/test.mp4 \
-c:v copy \
-c:a copy \
-f rtsp \
-rtsp_transport tcp \
$target_url
