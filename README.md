### nlopt 安装
- git clone https://github.com/stevengj/nlopt.git
- cd nlopt
- mkdir build && cd build
- cmake ..
- make
- sudo make install
- sudo apt install libdw-dev

### 下载cxr_fuel_ws，只适合ubuntu20
- git clone https://gitee.com/Canada-a/cxr_fuel_ws
- cd cxr_fuel_ws
- catkin_make

### 启动流程
- 配置好launch对应的传感器和里程计话题
- 启动探索launch
- roslaunch exploration_manager exploration.launch
- 启动控制节点
- rosrun exploration_manager fuel_nav
- 仿真的话，QGC解锁，然后切入offboard模式，此时飞机会飞到1m高度，然后rviz给个2d_nav_goal触发探索即可
- 实机的话，遥控器先解锁，然后切OFFBOARD开关进入offboard模式，此时飞机会飞到1m高度，然后rviz给个2d_nav_goal触发探索即可


