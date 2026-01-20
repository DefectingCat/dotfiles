#!/bin/bash

# 循环从2到29的数字范围
for i in {2..29}; do
    # 执行fastfetch命令，使用当前数字对应的jsonc配置文件
    echo "Current file examples/$i.jsonc"
    fastfetch -c "examples/$i.jsonc"

    # 可根据需要添加延迟，例如每次执行后等待1秒
    # sleep 1
done
