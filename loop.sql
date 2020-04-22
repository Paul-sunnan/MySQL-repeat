delimiter $$
　　
--drop procedure if exists wk;
create procedure wk()
begin
declare i int default 1;　　 
while i < 300 do

	insert into score(student_id,course_id,number) value(floor(1+rand()*52),floor(1+rand()*6),floor(rand()*40+60));

set i = i +1;
end while;
end $$
delimiter ;


create procedure wk()
begin

	insert into score(student_id,course_id,number) value(floor(1+rand()*52),floor(1+rand()*6),floor(rand()*40+60));

end while; 
end $$