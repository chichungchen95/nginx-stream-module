#by chichungchen95 

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'
BLACK='\033[30m'
WHITE_BG='\033[47m'

echo -e "${GREEN}[SETUP]${WHITE} ${YELLOW}安裝 Nginx Stream 模塊${WHITE}"
apt-get install -qq -y libnginx-mod-stream > /dev/null 2>&1 && echo "${GREEN}[SETUP]${WHITE} ${YELLOW}安裝成功${WHITE}" || { echo "${GREEN}[SETUP]${WHITE} ${RED}Error: 安裝失敗${WHITE}"; exit 1; }
mkdir -p /mnt/server/modules
cp /usr/lib/nginx/modules/ngx_stream_module.so /mnt/server/modules
echo "${GREEN}[CHECK]${WHITE} ${YELLOW}檢查模塊中...${WHITE}"
if ! nginx -V 2>&1 | grep -q -- "--with-stream"; then
    echo "${GREEN}[CHECK]${WHITE} ${RED}Error: 無法啟用 Nginx Stream 模塊${WHITE}"
    exit 2
fi
echo -e "${GREEN}[DONE]${WHITE} ${YELLOW}安裝了 Stream 模組的 Nginx 並已成功驗證。${WHITE}"
echo -e "${GREEN}[INFO]${WHITE} ${YELLOW}現在您可以在 Nginx 設定檔中設定 Stream。${WHITE}"
echo -e "${PURPLE}[chichungchen95]${WHITE} ${YELLOW}使用範例${WHITE}"
echo "
${CYAN}load_module /home/container/modules/ngx_stream_module.so;
stream {
    server {
        listen 12345; #你的port
        proxy_pass 127.0.0.1:54321; #他的port
    }
}${WHITE}"
echo "${GREEN}[說明]${WHITE}以上為範例可填入nginx/nginx.conf文件內${WHITE}"
echo "${GREEN}[說明]${WHITE}並將文件內的include /home/container/modules-enabled/*.conf; 前面註記起來如：# include /home/container/modules-enabled/*.conf;${WHITE}"
echo "${WHITE_BG}${RED}script by chichungchen95${WHITE}"
rm -rf install_nginx_stream.sh
