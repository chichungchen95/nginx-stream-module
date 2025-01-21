#by chichungchen95 
echo -e "[SETUP] ===============目前目錄==============="
ls -l
echo -e "[SETUP] 安裝 Nginx Stream 模塊"
apt-get install -qq -y libnginx-mod-stream > /dev/null 2>&1 && echo "[SETUP] 安裝成功" || { echo "[SETUP] Error: 安裝失敗"; exit 1; }
mkdir -p /mnt/server/modules
cp /usr/lib/nginx/modules/ngx_stream_module.so /mnt/server/modules
echo "[CHECK] 檢查模塊中..."
if ! nginx -V 2>&1 | grep -q -- "--with-stream"; then
    echo "[CHECK] Error: 無法啟用 Nginx Stream 模塊"
    exit 2
fi

echo -e "\033[32;43m[DONE] 安裝了 Stream 模組的 Nginx 並已成功驗證。\033[0m"
echo -e "\033[32;43m[INFO] 現在您可以在 Nginx 設定檔中設定 Stream。\033[0m"
echo -e "\033[31m[chichungchen95] 使用範例\033[0m"
echo "\033[34m
load_module /home/container/modules/ngx_stream_module.so;
stream {
    server {
        listen 12345;
        proxy_pass 127.0.0.1:54321;
    }
}

\033[0m"
echo "\033[32;43m以上為範例可填入nginx/nginx.conf文件內\033[0m"
echo "\033[32;43m並將文件內的\033[0m \033[34minclude /home/container/modules-enabled/*.conf;\033[0m \033[32;43m前面註記起來如：\033[0m \033[34m# include /home/container/modules-enabled/*.conf;\033[0m"
echo "\033[32;43mby chichungchen95\033[0m"
rm -rf install_nginx_stream.sh
