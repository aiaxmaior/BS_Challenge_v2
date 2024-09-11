/*** BrainStation Challenge: Kickstarter Report ***/
/*
-- Arjun Joshi
-- 09.08.2024
-- SQL, Visual Studio (Code) 2022, AWS RDS/EC2, Excel, Word
-- Conversion Rates as of 09.07.2024

Primary Methods:

Initial evaluation of dataset in Brainstation SQL webapp, evaluated for length, ideal environments to handle
preliminary validation.
It was determined that Excel would be suitable and most efficient method to weed out erroneous data; however
additional strategies for data validation are provided in data validation section below.
Data (tables) was downloaded from the BrainStation SQL webapp environment

--s--*****BAD DATA WILL BE IGNORED AND LEFT OUT OF DATA ANALYSIS*****-------



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

---------------------------------------------------------------------------r
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
BULK INSERT inf_cons
FROM 'I:\BrainStation Challenge\inf_comp.csv'
WITH
( 
	FORMAT='CSV',
	FIRSTROW=2
)
;
*/
/*
CREATE TABLE [dbo].[conv_rate] (
    [Id]        INT             NOT NULL,
    [currency]  NCHAR (10)      NULL,
    [conv_rate] DECIMAL (18, 5) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
*/

---------------------------------------------------------------------------
-- COMPILE DATA: Create Comprehensive View
---------------------------------------------------------------------------

/*
with base as(
select 
	c.id campaign_id,
	year(c.launched) yr_launch,
	year(c.deadline) yr_deadline, 
	datediff(day,c.launched,c.deadline) campaign_length, 
	c.name game,
	ct.id cat_id,
	ct.name category,
	c.sub_category_id,
	sc.id sc_id,
	sc.name sc_name,
	c.country_id,
	cyt.countryname,
	cyt.id,
	cyt.alpha2,
	cyt.alpha3,
	c.currency_id,
	c.launched,
	c.deadline,
	c.goal,
	c.pledged,
	c.backers,
	c.outcome,
	cr.currency,
	cr.conv_rate

	from campaign c
	inner join country cty
		on c.country_id = cty.id
	inner join cy_ct_id cyt
		ON cty.country = cyt.alpha2
	inner join sub_category sc
		ON c.sub_category_id = sc.id
	inner join category ct
		on sc.category_id = ct.id
	inner join conv_rate cr
		on c.currency_id = cr.id
)
select * 
into base_compiled2
from base
---------------------------------------------------------------------------
--Data Modifiers (Data has been standardized with formatting for import)
---------------------------------------------------------------------------
--Convert erroneous country N,0" to unknown for dat analysis


--UPDATE Country
--SET country = 'XX'
--WHERE id = 11





--select * from conv_rate;

Preliminary Analysis
*/
/*
select name, pledged
from base_compiled2
order by pledged DESC
*/
/*
select outcome, avg(goal) avg_goal, avg(pledged) avg_pledged, min(goal) min_goal, max(goal) max_goal, count(*)
from base_compiled2
group by outcome;
*/
/*
select countryname, count(*)
from base_compiled2
group by countryname
order by count(*) DESC;
*/
/*
select sum(pledged)/sum(backers) avg_pledged
from base_compiled2
where outcome='successful';
*/
/*
select sc_name, count(*)
from base_compiled2
group by sc_name
having sum(pledged)/sum(backers)>250
*/