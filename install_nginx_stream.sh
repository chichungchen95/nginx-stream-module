#by chichungchen95 
echo -e "[SETUP] ===============目前目錄==============="
ls -l
echo -e "[SETUP] 安裝 Nginx Stream 模塊"
apt-get update -qq > /dev/null 2>&1
apt-get install -qq -y nginx > /dev/null 2>&1 && echo "[SETUP] 安裝成功" || { echo "[SETUP] Error: 安裝失敗"; exit 1; }

echo "[CHECK] 檢查模塊中..."
if ! nginx -V 2>&1 | grep -q -- "--with-stream"; then
    echo "[CHECK] Error: 無法啟用 Nginx Stream 模塊"
    exit 2
fi

./install_nginx_stream.sh
echo -e "[DONE] 安裝了 Stream 模組的 Nginx 並已成功驗證。"
echo -e "[INFO] 現在您可以在 Nginx 設定檔中設定 Stream。"
echo -e "[chichungchen95] 使用範例"
echo "

stream {
    server {
        listen 12345;
        proxy_pass 127.0.0.1:54321;
    }
}

"
echo "以上為範例可填入nginx/nginx.conf文件內"
echo "並將文件內的 include /home/container/modules-enabled/*.conf;前面註記起來如：# include /home/container/modules-enabled/*.conf;"
echo "by chichungchen95"

echo -e "[INFO] You can now start the nginx web server"