#Get all paintings hired by a customer
select first_name, last_name, painting_name, category_name, date_hired from painting_transaction
join customer on customer.customer_id = painting_transaction.customer_id
join painting on painting.painting_id = painting_transaction.painting_id
join painting_category on painting.painting_category_id = painting_category.category_id
where painting_transaction.customer_id = 6;

#Get all paintings submitted by artist for hire
select first_name, last_name, painting_name, category_name from painting
join artist on painting.artist_id = artist.artist_id
join painting_category on painting.painting_category_id = painting_category.category_id
where for_hire = 0 
and painting.artist_id = 1;

#Get all painting not hired within 6 months
select CONCAT(first_name,' ',last_name) as 'artist name', painting_name, category_name, date_submitted, current_date() as 'current date', 
PERIOD_DIFF
(
EXTRACT(YEAR_MONTH FROM CURRENT_DATE),
EXTRACT(YEAR_MONTH FROM date_submitted)
) as diff,
is_hired 
from painting
join artist on painting.artist_id = artist.artist_id
join painting_category on painting.painting_category_id = painting_category.category_id
-- WHERE painting_status >= 6 AND is_hired = 0;
where 
painting.artist_id = 1
and is_hired = 0
and 
PERIOD_DIFF
(
EXTRACT(YEAR_MONTH FROM CURRENT_DATE),
EXTRACT(YEAR_MONTH FROM date_submitted)
) >= 6;

