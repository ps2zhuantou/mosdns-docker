#!/bin/sh
# 设置时区
ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

# 更新crontab配置并加载更新任务
echo "$CRON /scripts/update.sh && /scripts/restart.sh" > /etc/crontabs/root

# 启动cron服务
/usr/sbin/crond -b -l 8

# 启动程序
/usr/bin/mosdns start --dir /etc/mosdns