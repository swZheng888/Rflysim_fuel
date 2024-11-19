### 下载rflysim_fuel_ws(ubuntu20.04)
- git clone https://github.com/swZheng888/Rflysim_fuel_ws.git
- cd rflysim_fuel_ws
- catkin_make
### nlopt 安装
- git clone https://github.com/stevengj/nlopt.git
- cd nlopt
- mkdir build && cd build
- cmake ..
- make
- sudo make install
- sudo apt install libdw-dev
### 启动流程
- cd rflysim_fuel_ws/shfiles
- bash lidar.sh（mid360）
- bash single.sh(深度相机)


