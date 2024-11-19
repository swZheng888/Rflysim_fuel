#!/bin/bash

# 启动所有需要的进程
start_processes() {
  # 启动 swarm
  cd /root/sensor_pkg
  python single.py &
  PROCESS1=$!
  sleep 1

  # 启动 Rflysim PX4 节点
  cd /root/rflysim_fuel_ws
  source devel/setup.bash
  roslaunch rflysim_px4_node rflysim_px4_single_udp.launch &
  PROCESS2=$!
  
  if [ $? -ne 0 ]; then
    echo "启动 rflysim_px4_single_udp 失败"
    exit 1
  fi
  sleep 15
  
  # 启动探索节点
  roslaunch exploration_manager exploration.launch &
  PROCESS3=$!

  if [ $? -ne 0 ]; then
    echo "启动 rflysim_exploration_manager 失败"
    exit 1
  fi
}

# 捕获空格键按下并结束进程
trap "kill $PROCESS1 $PROCESS2 $PROCESS3; exit" SIGINT

# 启动进程
start_processes

# 监听键盘输入（等待A键按下）
while true; do
  read -n 1 -s key  # 读取一个字符（不显示）
  if [[ $key == "A" || $key == "a" ]]; then
    echo "检测到'A'键，结束所有进程..."
    kill $PROCESS1 $PROCESS2 $PROCESS3
    exit 0
  fi
done
