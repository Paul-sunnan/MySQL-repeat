#'赵钱孙李周郑王冯陈楮卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶姜戚谢喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍史唐费廉岑薛雷贺倪汤滕殷罗毕郝邬安常乐于时傅皮齐康伍余元卜顾孟平黄和穆萧尹姚邵湛汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈项祝董梁杜阮蓝闽席季麻强贾路娄危江童颜郭梅盛林刁锺徐丘骆高夏蔡田樊胡凌霍虞万支柯昝管卢莫经裘缪干解应宗丁宣贲邓郁单杭洪包诸左石崔吉钮龚程嵇邢滑裴陆荣翁';
delimiter $$
create function rand_name(n int) returns varchar(16)
begin
    -- 初始化一个16姓氏字符串，作为姓氏字符库
    declare family_str varchar (128) default '赵钱孙李周吴郑王冯陈蒋沈韩杨朱秦' ;
    -- 初始化一个32名字字符串，作为名字字符库
    declare name_str varchar (128) default '平书文若山向秋凡白斌绮烟从蕾天曼润又亦从语绮彤之玉凡梅依琴沛槐敏' charset utf8;
    -- 记录当前是第几个
    declare i int default 0;
    -- 记录生成结果
    declare full_name varchar(16) default '' ;
    -- 随机名字1、2位标记
    declare rand_num int DEFAULT 0;

    while i < n do
	    -- 若获取多个姓名，则用逗号','区分
	    set full_name = if(i > 0, concat(full_name, ','), full_name);
	    -- 随机取姓氏
	    set full_name = concat(full_name, SUBSTR(family_str, floor(1+rand()*16), 1));
	    -- 随机取名字
	    set full_name = concat(full_name, SUBSTR(name_str, floor(1+rand()*16), 1));
	    -- 名字是否为双字
	    set rand_num = rand()*10;
	    set full_name = if(rand_num > 5, concat(full_name, SUBSTR(name_str, floor(1+rand()*16), 1)), full_name);
	    set i = i + 1;
    end while;
    return full_name;
end$$ 
delimiter ; 