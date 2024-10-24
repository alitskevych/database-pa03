delimiter //

create procedure GetUserTransactionDetails(in input_user_id varchar(255))
begin
select
        u.user_id as user_id,
        u.nickname as user_nickname,
        u.user_email as user_email,
        t.transaction_date as transaction_date,
        t.amount as	 transaction_amount,
        p.project_name as project_name,
        p.status as project_status,
        f.revenue as project_revenue,
        f.expenses as project_expenses
from users u
left join Transactions t on u.transaction_id = t.transaction_id
left join Apps a on u.user_id = a.user_id
left join Project p on a.project_id = p.project_id
left join Finances f on p.finance_id = f.finance_id
where u.user_id = input_user_id;  -- Filter by user ID
end //

delimiter ;