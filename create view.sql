create view user_transaction_project_overview as
(
select
    u.user_id As user_id,
    u.nickname as user_nickname,
    u.user_email as user_email,
    t.transaction_date as transaction_date,
    t.amount as transaction_amount,
    p.project_name as project_name,
    p.status as project_status,
    f.revenue as project_revenue,
    f.expenses as project_expenses
from users u
left join transactions t on u.transaction_id = t.transaction_id
left join apps a on u.user_id = a.user_id
left join project p on a.project_id = p.project_id
left join finances f on p.finance_id = f.finance_id
where t.transaction_date >= curdate() - interval 1 year
order by t.transaction_date desc
)