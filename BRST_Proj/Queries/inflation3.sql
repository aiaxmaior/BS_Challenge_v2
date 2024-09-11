/*
select countryname, country_code, '2009' as year,  i.y2009 i_rate
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code, '2010', i.y2010 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code, '2011',i.y2011 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code, '2012',i.y2012 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code,'2013', i.y2013 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code,'2014', i.y2014 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code,'2015', i.y2015 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code,'2016', i.y2016 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code,'2017', i.y2017 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION ALL
select countryname, country_code,'2018', i.y2018
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2

	)
	

	*/
	/*
	with adjust_inf dec(20,10) as(

	from campaign c
	left join country cty
		on c.country_id = cty.id
	left join cy_ct_id cyt
		ON cty.country = cyt.alpha2
	left join inf_cons inf
		ON year(c.deadline) = inf.years and inf.CountryCode = cyt.alpha3
	
	)
	*/


	;
select * from inflation
;


	select c.*, inf.*, cyt.*, cty.*, c.goal*inf.inf_rate, goal, inf.*, infl.*
	from campaign c
	left join country cty
		on c.country_id = cty.id
	left join cy_ct_id cyt
		ON cty.country = cyt.alpha2
	left join inf_cons inf
		ON year(c.deadline) = inf.years and inf.CountryCode = cyt.alpha3
	left join inflation infl 
		on cyt.alpha3 = infl.country_code
	
	ORDER BY c.ID
;

;
select c.*, inf.*
from campaign c
	left join country cty
		on c.country_id = cty.id
	left join cy_ct_id cyt
		ON cty.country = cyt.alpha2
left join inf_cons inf
		ON inf.CountryCode = cyt.alpha3
	left join inflation infl on cyt.alpha3 = infl.country_code
