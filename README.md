# pterodactyl-nginx-stream-module

egg install script add nginx-stream-module

---
> 用於 `https://github.com/Ym0T/pterodactyl-nginx-egg` 的腳本

加載方法：

1. 進入你的pterodactyl-nginx-egg位置
![](https://github.com/chichungchen95/-/blob/main/%E6%88%AA%E5%9C%96%202025-01-21%2021.04.23.png?raw=true)

2. 查看上排目錄，有個Install Script點進去
![](https://github.com/chichungchen95/-/blob/main/%E6%88%AA%E5%9C%96%202025-01-21%2021.04.45.png?raw=true)

3. 將以下代碼
```echo "[Git] Cloning nginx-stream-module"
git clone https://github.com/chichungchen95/nginx-stream-module /mnt/server/mtemp > /dev/null 2>&1 && echo "[Git] Repository cloned successfully." || { echo "[Git] Error: nginx-stream-module repository clone failed."; exit 21; }
```
 加入至以下代碼的下方位置
```
git clone https://github.com/Ym0T/pterodactyl-nginx-egg /mnt/server/gtemp > /dev/null 2>&1 && echo "[Git] Repository cloned successfully." || { echo "[Git] Error: Default repository clone failed."; exit 21; }
```
![](https://github.com/chichungchen95/-/blob/main/%E6%88%AA%E5%9C%96%202025-01-21%2021.05.30.png?raw=true)

4. 將以下代碼
```
#複製模組
cp /mnt/server/mtemp/install_nginx_stream.sh /mnt/server || { echo "[Stream Install] 錯誤: 複製 'install_nginx_stream.sh' 失敗"; exit 22; }
＃腳本權限設置
chmod +x /mnt/server/install_nginx_stream.sh
＃腳本執行
./install_nginx_stream.sh
＃刪除無效目錄
rm -rf /mnt/server/mtemp
```
 加入至以下代碼的下方位置
```
rm -rf /mnt/server/gtemp
```
![](https://github.com/chichungchen95/-/blob/main/%E6%88%AA%E5%9C%96%202025-01-21%2021.09.39.png?raw=true)

5. 右下角保存
![](https://github.com/chichungchen95/-/blob/main/%E6%88%AA%E5%9C%96%202025-01-21%2021.09.59.png?raw=true)

---
> 於20250121測試成功
完成
