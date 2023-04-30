SELECT card_name, issued_amount from(
SELECT *, RANK() over(PARTITION BY card_name ORDER BY issue_year,issue_month) as rnk
FROM monthly_cards_issued) tbl1
where rnk = 1
ORDER BY issued_amount DESC;