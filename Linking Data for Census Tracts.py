import geopandas as gpd
import pandas as pd
from shapely.geometry import Point


csv_path = 'output_202335cal.csv'
csv_data = pd.read_csv(csv_path)


shp_path = 'm2.ACS/Median_Household_Income.shp'
gdf = gpd.read_file(shp_path, crs='EPSG:4326')

gdf = gdf.to_crs('EPSG:4326') 


gdf_sindex = gdf.sindex

geometry = [Point(xy) for xy in zip(csv_data['longitude'], csv_data['latitude'])]


points_gdf = gpd.GeoDataFrame(csv_data, geometry=geometry, crs='EPSG:4326')


points_gdf['OBJECTID'] = ''
points_gdf['B19049_007'] = ''


for idx, point in points_gdf.iterrows():
    matched_area = None
    matched_income = None


    possible_matches_index = list(gdf_sindex.intersection(point.geometry.bounds))
    possible_matches = gdf.iloc[possible_matches_index]

    for _, area_info in possible_matches.iterrows():
        if area_info['geometry'].contains(point.geometry):
            matched_area = area_info['OBJECTID']
            matched_income = area_info['B19049_007']
            break


    points_gdf.at[idx, 'OBJECTID'] = matched_area
    points_gdf.at[idx, 'B19049_007'] = matched_income


output_csv_path = 'output_202335cal.csv'
points_gdf.to_csv(output_csv_path, index=False)
