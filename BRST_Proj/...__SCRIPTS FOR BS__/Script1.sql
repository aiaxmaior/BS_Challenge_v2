select max(name)
from campaign;

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
;


--Data downloaded from BS SQL Web App examined in Excel CSV for potential errors in small data sets. Corrected for import into BRST db
/*
BULK INSERT brst.country
FROM 'I:\BrainStation Challenge\BrainStation\BrainStation\country.csv'
WITH
(
	FORMAT='CSV',
	FIRSTROW=2
)
;
GO



*/

/*
select * from country;
*/