#!/bin/sh

# 设置时区
/sbin/setup-timezone -z "$TZ"

# 更新crontab配置并加载更新任务
echo "$CRON /update.sh" > /etc/crontabs/root

# 启动cron服务
/usr/sbin/crond -b -l 8

# 立即执行一次更新任务
/update.sh
