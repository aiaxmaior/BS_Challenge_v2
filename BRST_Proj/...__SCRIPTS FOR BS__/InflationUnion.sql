--Inflation Union
--Columns need to be renamed appropriately


select countryname, country_code, '2009',  i.y2009 i_rate
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code, '2010', i.y2010 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code, '2011',i.y2011 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code, '2012',i.y2012 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code,'2013', i.y2013 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code,'2014', i.y2014 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code,'2015', i.y2015 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code,'2016', i.y2016 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code,'2017', i.y2017 
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2
	)
UNION
select countryname, country_code,'2018', i.y2018
from inflation i
where country_code in (
	select distinct cyt.alpha3
	from country cty
	inner join cy_ct_id cyt on cty.country = cyt.alpha2)
