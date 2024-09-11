/*** BrainStation Challenge: Kickstarter Report ***/
/*
-- Arjun Joshi
-- 09/08/2024
-- SQL, Visual Studio (Code) 2022, AWS RDS/EC2, Excel, Word

Primary Methods:

Initial evaluation of dataset in Brainstation SQL webapp, evaluated for length, ideal environments to handle
preliminary validation.
It was determined that Excel would be suitable and most efficient method to weed out erroneous data; however
additional strategies for data validation are provided in data validation section below.
Data (tables) was downloaded from the BrainStation SQL webapp environment

*/
----*****BAD DATA WILL BE IGNORED AND LEFT OUT OF DATA ANALYSIS*****-------



---------------------------------------------------------------------------
-- View Data
---------------------------------------------------------------------------

/*
Select * from [table];
Select column_name, data_type
from INFORMATION_SCHEMA.columns
where table_name='[table]';
SELECT DATALENGTH([column])
FROM [table];
*/

---------------------------------------------------------------------------
-- Data Validation
---------------------------------------------------------------------------

----Downloaded CSV files undergo preliminary data review in Excel if data, datasets are small enough to do so.
----Otherwise, can return rows with error using queries validating rows of data by column data_type
----If formatting is an issue, data is reviewed manually to determine cause but will ultimately be ignored so end analysis
--	won't corrupt or erroneously skew final analysis. It's not possible to confirm integrity of data in such cases.
--  In this data set, there were 4 rows evaluated in which sub_category_id came back as a text entry instead of integer.
--  Given the campaign table specifies only sub_category_id, trying to assign these data introduces possible error.
--  Had a category_id existed, it would be possible to conduct less detailed analysis of financial figures.
--  Rows: 2800, 6232, 13192, 14760 ignored due to sub_category_id incorrect assignment.

/*
select isnumeric(sub_category_id)
from campaign;
*/

---------------------------------------------------------------------------
--Create Tables (done from VSC interface, can be done by code as below
---------------------------------------------------------------------------
/*
CREATE TABLE campaign (
	[id]				INT NOT NULL,
	[name]				VARCHAR(200) NOT NULL,
	[sub_category_id]	INT,
	[currency_id]		INT,
	[launched]			DATE,
	[deadline]			DATE,
	[goal]				DEC(15,4),
	[pledged]			DEC(15,4),
	[backers]			INT,
	[outcome]			VARCHAR(30),
	[isint]				BIT );

*/


---------------------------------------------------------------------------
--Data Insertion (Data has been standardized with formatting for import)
---------------------------------------------------------------------------

-- 4 data rows omitted. 
/*
BULK INSERT BRST.dbo.category
FROM 'I:\BrainStation Challenge\BrainStation\BrainStation\category.csv'
WITH
(
	FORMAT='CSV',
	FIRSTROW=2
)
;
--*/

select * from Table1;