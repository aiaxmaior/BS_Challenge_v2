/*
*/

--ALTER TABLE currency
--ADD conv_rate dec(18,10)
--select * from campaign;
--FROM campaign cg
--INNER JOIN currency ON cg.currency_id = cy.id
/*
SELECT cm.id as cmid, 
	   cm.name cm_name,
	   ct.name as cat, 
	   sc.name as sub_cat,
	   cm.goal,
	   cm.pledged,
	   cy.currency as currency,
	   cm.backers,
	   cm.outcome
FROM campaign as cm
INNER JOIN sub_category AS sc
	ON (cm.sub_category_id = sc.id)
INNER JOIN category AS ct
	ON (ct.id = sc.category_id)
INNER JOIN currency as cy
	ON (cm.currency_id = cy.id)
ORDER BY ct.id;



*/
--CONV RATE AS OF 09.07.2024

/*
Select c.*, sc.name, cr.currency, cr.conv_rate ,
sc.name, sc.name, avg(c.goal), AVG(c.pledged),

from campaign c 
inner join sub_category sc
	ON (c.sub_category_id = sc.id)
INNER JOIN conv_rate cr
	ON c.currency_id=cr.id
where sub_category_id=14
--where sub_category_id in (10,20)
;
*/

--Match Inflation

/*
select ctY.*, cyt.*, i.country_code
from country ctY
left join cy_ct_id cyt  on cty.country = cyt.alpha2
LEFT JOIN inflation i on cyt.alpha3 = i.country_code
order by cyt.countryname
;

-- Join Inflation Data
-- *Needs to be structured for appropriate analysis

select c.*, c.country_id, cty.country, i.country_code, i.*
from campaign c
left join country cty
	on c.country_id = cty.id
left join cy_ct_id cyt  
	on cty.country = cyt.alpha2
LEFT JOIN inflation i 
	on cyt.alpha3 = i.country_code
--where COUNTRY_CODE IS NULL
order by c.country_id asc
;


select distinct ct.country, ct.id 
from campaign c
inner join country ct
	on c.country_id = ct.id
order by ct.id asc
;
*/

with base_information (id, name, cat_name, subcat_name, country_id, currency_id, goal, pledged, backers, outcome, deadline)
	as (
select c.id, c.name, ct.name, sc.name, c.country_id, c.currency_id, c.goal, c.pledged, c.backers, c.outcome, c.deadline
from campaign c
inner join sub_category sc
	ON (c.sub_category_id = sc.id)
inner join category ct
	ON sc.category_id = ct.id
	)
,
missed_country_count (ct_count)
as (
select count(*) from campaign
where country_id = 11)
,
missed_country as (
select * from campaign
where 
	country_id = 11 
	and
	outcome !='undefined')

SELECT * FROM MISSED_COUNTRY

;
/*
with get_successful (country_id,  OUTCOME, count(*))
	AS(
	select count(*)
	from campaign
	group by country_id,
	*/
select 
	c.country_id, 
	cty.country,
	cyt.countryname,
	ct.name, 
	sum(c.goal*cr.conv_rate ) goal_toUSD, 
	sum(c.pledged*cr.conv_rate ) pledge_toUSD, 
	(sum(c.pledged)/sum(c.goal))*100 perc_raised,  
	avg(datediff(day,c.launched,c.deadline)) days_avg,
	avg(c.backers) backers_avg,
	c.outcome	
FROM campaign c
left join sub_category sc 
	on c.sub_category_id = sc.id
left JOIN category ct
	ON (sc.category_id=ct.id)
left JOIN currency cy
	ON (c.currency_id = cy.id)
left JOIN conv_rate cr
	ON cy.currency=cr.currency
left JOIN country cty
	ON (c.country_id = cty.id)
LEFT JOIN cy_ct_id cyt 
	ON cty.country=cyt.alpha2
WHERE country_id!=11
Group by c.country_id, ct.name, cty.country, cyt.countryname, c.outcome
UNION
select 
	c.country_id, 
	cty.country,
	cyt.countryname,
	ct.name,
	NULL AS goal_toUSD, 
	NULL AS pledge_toUSD, 
	(sum(c.pledged)/sum(c.goal))*100 perc_raised,  
	avg(datediff(day,c.launched,c.deadline)) days_avg,
	avg(c.backers) backers_avg,
	c.outcome
FROM campaign c
left join sub_category sc 
	on c.sub_category_id = sc.id
left JOIN category ct
	ON (sc.category_id=ct.id)
left JOIN currency cy
	ON (c.currency_id = cy.id)
left JOIN conv_rate cr
	ON cy.currency=cr.currency
left JOIN country cty
	ON (c.country_id = cty.id)
LEFT JOIN cy_ct_id cyt 
	ON cty.country=cyt.alpha2
WHERE country_id=11
Group by c.country_id, ct.name, cty.country, cyt.countryname, c.outcome
Order by c.country_id, cty.country, ct.name
/*
select 

	ct.name, 
	--if(c.country_code = 11, 'XX', cty.country),
	c.country_id,
	cty.country,
	cr.conv_rate, 
	format(sum(c.goal*cr.conv_rate),'c','en-US') conv_sum_goal, 
	format(sum(c.pledged*cr.conv_rate),'c','en-US') conv_sum_pledged, 
	sum(c.goal) sum_goal, 
	sum(c.pledged) sum_pledged,
	sum(c.pledged)/sum(c.goal) earn_ratio,
	avg(DATEDIFF(day, c.launched, c.deadline))  days_active
FROM campaign c
left join sub_category sc
	on c.sub_category_id = sc.id
left JOIN category ct
	ON (sc.category_id=ct.id)
left JOIN currency cy
	ON (c.currency_id = cy.id)
left JOIN conv_rate cr
	ON cy.currency=cr.currency
left JOIN country cty
	ON (c.country_id = cty.id)
GROUP BY ct.name, c.country_id, cty.country, cr.conv_rate, c.launched, c.deadline
	
ORDER BY cty.country ASC, ct.name ASC, earn_ratio asc;
*/
---------------------------------------------
;

select cr.currency, sum(c.goal*cr.conv_rate) conv_goal, sum(c.pledged*cr.conv_rate) conv_pledged
from campaign c
inner join sub_category sc
	ON c.sub_category_id = sc.id
inner join category ct
	ON sc.category_id = ct.id
inner join conv_rate cr
	ON c.currency_id = cr.id
where ct.id=7
	and c.outcome = 'successful'
group by cr.currency
order by conv_goal DESC
--ALTER TABLE campaign
--[ALTER COLUMN goal dec(18,2);

/*
select distinct ct.id,sc.id,ct.name, sc.name
FROM category AS ct
INNER JOIN sub_category AS sc
	ON (ct.id=sc.category_id)
WHERE ct.id = 7
ORDER By ct.id ASC, sc.id ASC
	;
*/
