/*
With successful_yr as(
select 
	count(campaign_id) num_campaigns,
	sum(goal) Sum_goal,
	avg(goal) Avg_goal,
	sum(pledged) sum_pledged,
	avg(pledged) avg_pledged,
	outcome,
	yr_deadline,
	avg(backers) avg_backers
from base_compiled2
where outcome='successful'
group by outcome, yr_deadline
),

other_yr as(
select 
	count(campaign_id) num_campaigns,
	sum(goal) Sum_goal,
	avg(goal) Avg_goal,
	sum(pledged) sum_pledged,
	avg(pledged) avg_pledged,
	outcome,
	yr_deadline,
	avg(backers) avg_backers
from base_compiled2
where pledged<20000 and sc_Id = 14
group by outcome, yr_deadline
)
select * from successful_yr
order by outcome, yr_deadline
;

select yr_deadline, category, avg(backers) avg_no_backers, sum(pledged)/sum(backers) avg_pledge, sum(pledged)
from base_compiled2
where backers !=0
group by yr_deadline, category
order by yr_deadline, category
;

select yr_deadline
from base_compiled2
where category = 'Games'
order by sc_id
;
select yr_deadline,
category,
count(*) numP,
sum(goal) sumG, 
sum(pledged) sumP, 
sum(backers) sumB
from base_compiled2
group by yr_deadline, category
order by yr_deadline, category
;

*/
/*
select yr_deadline, sc_name,outcome, count(*) num_campaigns, sum(backers) num_backers, sum(pledged)/sum(backers) avg_backerP, sum(goal) sumG, sum(pledged) sumP, avg(goal) avgG, avg(pledged) avgP, avg(pledged)/avg(goal) PGRatio
from base_compiled2
where category='Games' and outcome='successful' and backers!=0
group by yr_deadline, sc_name,outcome
union
select yr_deadline, sc_name,'failed/inactive', count(*) num_campaigns, sum(backers) num_backers, sum(pledged)/sum(backers) avg_backerP,sum(goal) sumG, sum(pledged) sumP, avg(goal) avgG, avg(pledged) avgP, avg(pledged)/avg(goal) PGRatio
from base_compiled2
where category='Games' and outcome not in ('successful', 'live') and backers!=0
group by yr_deadline, sc_name
order by yr_deadline, sc_name
*/
 

