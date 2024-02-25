import json
import os
import pandas as pd
import datetime
from collections import defaultdict
import shutil


from dateutil import parser
import math  



def date_to_timestamp(date_str):
    try:
        dt_object = datetime.datetime.strptime(date_str, '%Y年%m月%d日')
        timestamp = dt_object.timestamp() * 1000  
        return int(timestamp)
    except ValueError:
        print("error")
        return None

def is_timestamp_in_range(timestamp, start_timestamp, end_timestamp):
    return start_timestamp <= timestamp <= end_timestamp

if __name__ == "__main__":

    timeRangeStart1 = "2015年11月8日"
    timeStampRangeStart1 = date_to_timestamp(timeRangeStart1)
    timeRangeEnd1 = "2018年11月7日"
    timeStampRangeEnd1 = date_to_timestamp(timeRangeEnd1)

    timeRangeStart2 = "2018年12月6日"
    timeStampRangeStart2 = date_to_timestamp(timeRangeStart2)
    timeRangeEnd2 = "2021年12月5日"
    timeStampRangeEnd2 = date_to_timestamp(timeRangeEnd2)


    # print(timeStampRangeStart1) # 1446912000000
    # print(timeStampRangeEnd1) # 1541520000000




dir_path = 'D:/桌面/2023_35' 
filenames = os.listdir (dir_path) 

result_data = pd.DataFrame()

index = 0 




final_output_data = []



for filename in filenames:
    filepath = os.path.join (dir_path, filename)
    try:
        with open(filepath,'r',encoding='utf-8') as json_obj:
            json_data = json.load(json_obj)


            index += 1
            #print("\r{:3}".format(index),end="")
            

            if json_data['data']['property']['state'] != 'CA':
                continue

            if json_data['data']['property']['longitude'] is None:
                continue
            if json_data['data']['property']['latitude'] is None:
                continue
            if json_data['data']['property']['resoFacts']['bedrooms'] is None:
                continue
            if json_data['data']['property']['resoFacts']['bathrooms'] is None:
                continue
            if json_data['data']['property']['resoFacts']['parking'] is None:
                continue
            if json_data['data']['property']['lotAreaValue'] is None:
                continue
            if json_data['data']['property']['livingAreaValue'] is None:
                continue
            if json_data['data']['property']['yearBuilt'] is None:
                continue



            
            obj_history = json_data['data']['property']['priceHistory']


            
            satisfying_timestamps = []
            pending_sale_prices = []

            
            
            
            for i, obj in enumerate(obj_history):
                if i == len(obj_history) - 1:
                    break  

                event = obj['event']
                next_event = obj_history[i + 1]['event']  
                timestamp = obj['time']


                if is_timestamp_in_range(timestamp, timeStampRangeStart1, timeStampRangeEnd1) or \
                        is_timestamp_in_range(timestamp, timeStampRangeStart2, timeStampRangeEnd2):
                    if event == 'Sold' and next_event == 'Pending sale':
                        satisfying_timestamps.append(timestamp)
                        pending_sale_prices.append(obj_history[i + 1]['price'])

                        

                lnlivingAreaValue = math.log(json_data['data']['property']['livingAreaValue'])
                        
            
            for ts, ps_price in zip(satisfying_timestamps, pending_sale_prices):
            

                row_data = {
                    'zpid': json_data['data']['property']['zpid'],
                    'state': json_data['data']['property']['state'],
                    'city': json_data['data']['property']['city'],
                    'county': json_data['data']['property']['county'],
                    'countyFIPS': json_data['data']['property']['countyFIPS'],
                    'streetAddress': json_data['data']['property']['address']['streetAddress'],
                    'zipcode': json_data['data']['property']['address']['zipcode'],
                    'homeStatus': json_data['data']['property']['homeStatus'],
                    'homeType': json_data['data']['property']['resoFacts']['homeType'],
                    'longitude': json_data['data']['property']['longitude'],
                    'latitude': json_data['data']['property']['latitude'],
                    'bedrooms': json_data['data']['property']['resoFacts']['bedrooms'],
                    'bathrooms': json_data['data']['property']['resoFacts']['bathrooms'],
                    'parking': json_data['data']['property']['resoFacts']['parking'],
                    'livingAreaValue': json_data['data']['property']['livingAreaValue'],
                    'lnlivingAreaValue': lnlivingAreaValue,
                    'yearBuilt': json_data['data']['property']['yearBuilt'],
                    'Sold_time': datetime.datetime.fromtimestamp(ts / 1000).strftime('%Y.%m.%d'),
                    'Pending_sale_price': ps_price
                }

                
                ln_price = math.log(ps_price)  
                row_data['Pending_sale_lnprice'] = ln_price



                final_output_data.append(row_data)

    
    except: 

        print('error:',filename)
        continue





result_data = pd.DataFrame(final_output_data)


result_data.to_csv('output_2023cal35.csv', index=None)
print(result_data)
