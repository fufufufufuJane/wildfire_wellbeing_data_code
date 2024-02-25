import geopandas as gpd
import pandas as pd
from shapely.geometry import Point


csv_path = 'merged.csv'
csv_data = pd.read_csv(csv_path)


shp_files = ['m3.easymaptest/Camp_boundary.shp', 
             'm3.easymaptest/boundary_0_10.shp', 
             'm3.easymaptest/boundary_10_20.shp', 
             'm3.easymaptest/boundary_20_50.shp', 
             'm3.easymaptest/boundary_50_100.shp', 
             'm3.easymaptest/boundary_100_150.shp', 
             'm3.easymaptest/boundary_150_200.shp']


gdf_list = [gpd.read_file(shp).to_crs('EPSG:4326') for shp in shp_files]

print(gdf_list)


geometry = [Point(xy) for xy in zip(csv_data['longitude'], csv_data['latitude'])]


points_gdf = gpd.GeoDataFrame(csv_data, geometry=geometry, crs='EPSG:4326')
print(points_gdf)


points_gdf['assigned_value'] = 500


assigned_values = [0, 10, 20, 50, 100, 150, 200]
for idx, gdf in enumerate(gdf_list):
    points_in_region = points_gdf.within(gdf.unary_union)
    points_gdf.loc[points_in_region, 'assigned_value'] = assigned_values[idx]
print(f"Point {idx} is in region: {points_in_region}")


output_csv_path = 'output_202335cal.csv'
points_gdf.to_csv(output_csv_path, index=False)
