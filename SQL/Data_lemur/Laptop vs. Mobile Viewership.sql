SELECT
  SUM(CASE when device_type = 'laptop' then 1 else 0 end) as laptop_view,
  SUM(CASE when device_type in ('tablet' , 'phone') then 1 else 0 end) as mobile_view
  from viewership