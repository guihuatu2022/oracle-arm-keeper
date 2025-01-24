#!/bin/bash
# Oracle ARM保活脚本（小白专用版）
LOG_FILE="/var/log/arm_keeper.log"

# 随机CPU活动
cpu_boost() {
  echo "[$(date '+%F %T')] CPU活跃: 触发随机计算" >> $LOG_FILE
  openssl speed -seconds $((RANDOM%3+1)) sha256 >/dev/null 2>&1
}

# 内存波动
mem_boost() {
  size=$((50 + RANDOM % 100))
  tmp=$(mktemp /dev/shm/mem.XXXXXX)
  dd if=/dev/urandom of=$tmp bs=1M count=$size status=none
  sleep $((RANDOM%10+5))
  rm -f $tmp
  echo "[$(date '+%F %T')] 内存波动: ${size}MB" >> $LOG_FILE
}

# 网络请求
net_boost() {
  sites=("google.com" "github.com" "microsoft.com")
  site=${sites[$RANDOM % 3]}
  ping -c 2 $site >/dev/null 2>&1
  echo "[$(date '+%F %T')] 网络访问: $site" >> $LOG_FILE
}

# 主循环
while true; do
  cpu_boost
  mem_boost
  net_boost
  sleep $((600 + RANDOM % 300)) # 10-15分钟间隔
done
