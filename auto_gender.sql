
delimiter $$
create function rand_gender2() returns char(10)
	begin
	declare allgender_str char(20) default '男女';
	declare gender_str char(10);
	set gender_str = substr(allgender_str,floor(1+rand()*2),1);
	return gender_str;
end $$
delimiter ;

