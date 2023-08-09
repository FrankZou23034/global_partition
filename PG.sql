drop table if exists frank;
CREATE TABLE frank (
  id INT not null,
  day date not null default now(),
  external_id int not null,
  primary key (id, day),
  unique (external_id, day)
) PARTITION BY RANGE (day);
CREATE TABLE frank_p1 PARTITION OF frank
for VALUES FROM ('2001-01-01') TO ('2002-01-01');

CREATE TABLE frank_p2 PARTITION OF frank
for VALUES FROM ('2002-01-01') TO ('2003-01-01');

insert into frank values(1,'2001-06-01',2);
insert into frank values(1,'2002-06-01',2);
select tableoid::regclass , * from frank;
