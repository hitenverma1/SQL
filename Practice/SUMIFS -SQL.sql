select * from loan_table
inner join 
(select group_id, sum(total_outstanding_amount) as sumif
from loan_table
group by group_id) as table2 
on loan_table.group_id = table2.group_id