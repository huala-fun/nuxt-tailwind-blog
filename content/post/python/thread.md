---
title: Python 多线程多进程
description: Python 多线程多进程
date: "2023-01-02"
tags:
  - 多线程
  - 多进程
  - Python
---

### 多线程实例

```python
import concurrent.futures
import time
def process_data(data):
    # 这里是处理数据的业务逻辑
    print(f"{data} ok")
    for i in range (10):
        print(i)
        time.sleep(1)



def main():
    # 假设data_list是你要批量处理的数据列表
    data_list = [ g for g in range(5) ]

    # 设定线程池大小，根据实际情况调整
    pool_size = 4

    # 使用ThreadPoolExecutor创建线程池
    with concurrent.futures.ThreadPoolExecutor(max_workers=pool_size) as executor:
        # 提交任务给线程池
        # 这里将每个数据传递给process_data函数进行处理
        futures = {executor.submit(process_data, data): data for data in data_list}

        # 等待所有线程完成
        concurrent.futures.wait(futures)

if __name__ == "__main__":
    main()

```

## 多进程实例

```python
import datetime
from multiprocessing import Pool
def run(curr_date):
    try:
        print(curr_date)
    except Exception as e:
        print(e)
    finally:
        print("end")
if __name__ == '__main__':
    pool = Pool(4)
    """
    六个进程写数据
    """
    p_num = 6
    p_pool = Pool(p_num)
    start_date = datetime.datetime(year=2023, month=6, day=21)
    end_date = datetime.datetime(year=2023, month=6, day=25)
    while start_date <= end_date:
        p_pool.apply_async(run, [start_date.__format__("%Y-%m-%d")])
        start_date += datetime.timedelta(days=1)
    p_pool.close()
    p_pool.join()
```
