--select format(goal,'c','en-US')
--from campaign
--where id=1f
--UPDATE currency
--SET
--from currency;

--select *
--FROM currency cy
--INNER JOIN country cty
--	ON 

/*
select c.country_id, cy.currency, cty.country
from brst.dbo.campaign c
inner join brst.dbo.currency cy
	on c.currency_id = cy.id
inner join brst.dbo.country cty
	on c.country_id = cty.id
group by cty.country, c.country_id, cy.currency
	;
	*/
	/*
	select distinct count(currency_id) as counts, c.currency_id, c.country_id, cy.currency from campaign c
	Inner join currency cy on c.currency_id = cy.id
	where country_id = 11
	group by c.currency_id, cy.currency, c.country_id
	order by counts DESC;
	
	select * from cy_ct_id;
	select * 
	from country ct
	left join cy_ct_id cyt on ct.id = cyt.alpha2
	;
	*/
	/*
	select * from inf_cons
	select * from cy_ct_id;
	select * from country;
	select * from campaign
	*/

