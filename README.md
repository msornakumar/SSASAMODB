#SSASAMODB  

##Project Description
SSAS AMO DB is a database version of AMO which helps to view the metadata stored in the SSAS cube. The Metadata will be loaded into a SQL Server database from the SSAS cube using AMO using SSIS package. From that database user can generate reports for the SSAS metadata. A database diagram has been enclosed in the download for your reference

This database stores the below SSAS objects and their properties

Server  
Databases  
DataSource  
DataSourceView  
DataSourceViewTablecolumns 
Cube  
CubeDimension  
DimensionAttribute  
AttributeKeyColumns  
AttributeKeyColumns  
AttributeRelationship  
Hierarchy  
HierarchyLevel  
MeasureGroup  
Measure   
MeasureGroupDimension  
Aggregation  
AggregationDesign  
AggregationDimension  
KPI  
ProactiveCaching  
Partition


The SSIS package takes up the below configurable values 

OLAPServer - OLAP server from which Metadata needs to be extracted.   
OLAPDB - OLAP Database from which Metadata needs to be extracted.   
OLAPCube - OLAP Cube from which Metadata needs to be extracted.   
SSASAMODBServer - Server in which AMO DB resides  
SSASAMODBDatabase - Database which has been setup for storing metadata as per installation instructions.  

When OLAPServer , OLAPDB and OLAPcube values are provided the existing metadata for the above will be deleted and reloaded.

How to install and run this app
1. Create a database   
2. Run the Table scripts from Scripts\Tables.  
3. Run the SP scripts from Scripts\Sps.  
4. Open the SSIS package from SSASAMODB folder.  
5. Configure the parameters as mentioned above and run the SSIS package.  
