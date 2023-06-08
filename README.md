# Integrator Project - FEUP

Curricular internship at ARMIS Group to complete the curricular unit Integrator Project (PI) at LEIC.

## Project

The project consists of an initial treatment of data and subsequent development of a Power BI document, that allows the identification of productivity patterns in the data collected from projects. Data is copied from a dbo schema to a stg schema, with use of Azure Data Factory. Then, they are transformed according to the dw model, using a Python Notebook on Azure Databricks. All the three schemas are stored in an unique Azure SQL Database (inserted in an Azure SQL Server). The dw data is then loaded into Power BI, where the user can visualize the data in a more visual way, with the help of some metrics that calculate useful parameters for the analysis.