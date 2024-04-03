FROM hwr/emerge_image:latest

RUN apt update && \
    apt-get install -y ros-humble-ackermann-msgs && \
    apt-get install -y ros-humble-foxglove-bridge && \
    apt install nano -y

CMD ["bash", "-c", "source /opt/ros/humble/setup.bash && \
                    export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp && \
                    export CYCLONEDDS_URI=/home/emerge/cyclonedds_config.xml && \
                    sudo sysctl net.ipv4.ipfrag_time=3 && \
                    sudo sysctl net.ipv4.ipfrag_high_thresh=1342177280 && \
                    sudo sysctl -w net.core.rmem_max=67108864 net.core.rmem_default=67108864 && \
                    sudo sysctl -w net.core.wmem_max=67108864 net.core.wmem_default=67108864 && \
                    export RCUTILS_COLORIZED_OUTPUT=1 && \
                    export RCUTILS_CONSOLE_OUTPUT_FORMAT=\"[{severity} {time}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})\" && \
                    source /home/emerge/autowarefoundation/install/setup.bash && \
                    cd /home/emerge/autowarefoundation && \
                    ./start.sh && \
                    wait"]
