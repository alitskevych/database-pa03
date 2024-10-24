delimiter //

create trigger update_net_profit
after insert on	 project
for each row
begin
    declare v_revenue bigint;
    declare	 v_expenses bigint;

    select revenue, expenses
    into v_revenue, v_expenses
    from finances
    where finance_id = new.finance_id;

    update finances
    set	net_profit = v_revenue - v_expenses
    where finance_id = new.finance_id;
end	 //

delimiter ;