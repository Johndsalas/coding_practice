

select * from properties_2017; -- 2,985,217

select parcelid, count(*). -- no duplicates 
from properties_2017
group by parcelid
order by parcelid desc;

select * 
from properties_2017
left join airconditioningtype using(airconditioningtypeid);