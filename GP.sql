drop table if exists frank;
CREATE TABLE frank (
  id INT not null,
  day date not null default now(),
  external_id int not null,
  primary key (id, day),
  unique (external_id, day)
) PARTITION BY RANGE (day)
  (START (date '2000-01-01') INCLUSIVE
    END (date '2003-01-01') EXCLUSIVE
    EVERY (INTERVAL '1 year') );
   
insert into frank values(1,'2001-06-01',2);
insert into frank values(1,'2002-06-01',2);    
   
select tableoid::regclass , * from frank;
