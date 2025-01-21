# pterodactyl-nginx-stream-module

egg install script add nginx-stream-module

---
用於 https://github.com/Ym0T/pterodactyl-nginx-egg 的腳本

加載方法：

1.進入pterodactyl panel 點擊 Nests

2.進入你的pterodactyl-nginx-egg位置

3.查看上排目錄，有個Install Script點進去

4.將以下代碼
```echo "[Git] Cloning nginx-stream-module"
git clone https://github.com/chichungchen95/nginx-stream-module /mnt/server/mtemp > /dev/null 2>&1 && echo "[Git] Repository cloned successfully." || { echo "[Git] Error: nginx-stream-module repository clone failed."; exit 21; }
```
加入至以下代碼的下方位置
```
git clone https://github.com/Ym0T/pterodactyl-nginx-egg /mnt/server/gtemp > /dev/null 2>&1 && echo "[Git] Repository cloned successfully." || { echo "[Git] Error: Default repository clone failed."; exit 21; }
```

5.將
```
chmod +x /mnt/server/install_nginx_stream.sh
./install_nginx_stream.sh
rm -rf /mnt/server/gtemp
```
加入至以下代碼的下方位置
```
rm -rf /mnt/server/gtemp
```

6.右下角保存

---
完成
