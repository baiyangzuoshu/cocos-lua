# -*- coding: utf-8 -*-

def chinese(data):
    if isinstance(data, tuple):  # 判断是否是元祖
        return '(' + ','.join(list(data)) + ')'
    elif isinstance(data, list):  # 判断是否是列表
        try:
            # 如果列表中有元祖，join将不能拼接，所以捕获错误进行递归
            return '[' + ','.join(data) + ']'
        except:
            data_str = '['
            for i in data:
                # 调用自身方法
                data_str += chinese(i)
            return data_str + ']'
