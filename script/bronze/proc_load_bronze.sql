```sql
/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Purpose:
    This stored procedure loads data from CSV files into the 'bronze' schema.

    It does the following:
    - Deletes old data from the bronze tables.
    - Loads new data from CSV files using BULK INSERT.
    - Shows how long each table takes to load.
    - Shows an error message if something goes wrong.

Parameters:
    None.

Usage:
    EXEC bronze.load_bronze;

===============================================================================
*/

EXEC bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    DECLARE
        @start_time DATETIME,
        @end_time DATETIME;

    BEGIN TRY

        PRINT '========================================================================='
        PRINT 'Loading Bronze Layer'
        PRINT '========================================================================='


        -------------------------------------------------------------------------
        -- Loading CRM Tables
        -------------------------------------------------------------------------

        PRINT '-------------------------------------------------------------------------'
        PRINT 'Loading CRM Tables'
        PRINT '-------------------------------------------------------------------------'


        -------------------------------------------------------------------------
        -- bronze.crm_cust_info
        -------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating table: bronze.crm_cust_info';

        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting data into: bronze.crm_cust_info';

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\duise\OneDrive\Desktop\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '--------';


        -------------------------------------------------------------------------
        -- bronze.crm_prd_info
        -------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating table: bronze.crm_prd_info';

        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting data into: bronze.crm_prd_info';

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\duise\OneDrive\Desktop\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '--------';


        -------------------------------------------------------------------------
        -- bronze.crm_sales_details
        -------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating table: bronze.crm_sales_details';

        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting data into: bronze.crm_sales_details';

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\duise\OneDrive\Desktop\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '--------';


        -------------------------------------------------------------------------
        -- Loading ERP Tables
        -------------------------------------------------------------------------

        PRINT '-------------------------------------------------------------------------'
        PRINT 'Loading ERP Tables'
        PRINT '-------------------------------------------------------------------------'


        -------------------------------------------------------------------------
        -- bronze.erp_CUST_AZ12
        -------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating table: bronze.erp_CUST_AZ12';

        TRUNCATE TABLE bronze.erp_CUST_AZ12;

        PRINT '>> Inserting data into: bronze.erp_CUST_AZ12';

        BULK INSERT bronze.erp_CUST_AZ12
        FROM 'C:\Users\duise\OneDrive\Desktop\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '--------';


        -------------------------------------------------------------------------
        -- bronze.erp_LOC_A101
        -------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating table: bronze.erp_LOC_A101';

        TRUNCATE TABLE bronze.erp_LOC_A101;

        PRINT '>> Inserting data into: bronze.erp_LOC_A101';

        BULK INSERT bronze.erp_LOC_A101
        FROM 'C:\Users\duise\OneDrive\Desktop\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '--------';


        -------------------------------------------------------------------------
        -- bronze.erp_PX_CAT_G1V2
        -------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating table: bronze.erp_PX_CAT_G1V2';

        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

        PRINT '>> Inserting data into: bronze.erp_PX_CAT_G1V2';

        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM 'C:\Users\duise\OneDrive\Desktop\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '--------';


        PRINT '========================================================================='
        PRINT 'Bronze Layer Loading Completed'
        PRINT '========================================================================='

    END TRY

    BEGIN CATCH

        PRINT '========================================================================='
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER'

        PRINT 'Error Number: '
            + CAST(ERROR_NUMBER() AS NVARCHAR(20));

        PRINT 'Error Message: '
            + ERROR_MESSAGE();

        PRINT '========================================================================='

    END CATCH

END;
```
