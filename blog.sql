create database blog with owner postgres;
create table posts(
	"id_post" SERIAL primary key,
	"title" varchar not null,
	"id_user" int,
	"content" text,
	"date" date
);


create table users(
	"id_user" SERIAL primary key,
	"name" varchar,
	"id_role" int,
	"email" varchar not null unique,
	"password" varchar not null,
	"active" boolean
);


create table roles(
	"id_role" SERIAL primary key,
	"name" varchar
);

create table list_comments(
	"id_list_comment" SERIAL primary key,
	"id_post" int,
	"id_comment" int
);

create table "comments"(
	"id_comment" SERIAL primary key,
	"id_user" int,
	"content" text,
	"date" date
);

create table list_categories(
	"id_list_category" SERIAL primary key,
	"id_post" int,
	"id_category" int
);


create table categories(
	"id_category" SERIAL primary key,
	"name" varchar
);


alter table posts add foreign key (id_user) references users(id_user);
alter table users add foreign key (id_role) references roles(id_role);
alter table list_comments add foreign key (id_post) references posts(id_post);
alter table list_comments add foreign key (id_comment) references "comments"(id_comment);
alter table "comments" add foreign key (id_user) references users(id_user);
alter table list_categories add foreign key (id_post) references posts(id_post);
alter table list_categories add foreign key (id_category) references categories(id_category);


insert into categories (name) values ('Android'), ('Web dev'), ('Javascript'), ('SQL');
insert into roles (name) values ('admin'), ('moderator'), ('author'), ('visitor');
insert into users (name, id_role, email, password, active) 
values 
('Debee', 1, 'dtitcumb0@usa.gov', 'jjhUKioko@@', true),
('Doloritas', 2, 'jminor4@godaddy.com', '222sGtyy__', true),
('Tobey', 3, 'lfrizelln@cargocollective.com', 'asddaFF455', true);
insert into posts (title, id_user, content, date)
values
('sunt aut facere repellat provident occaecati excepturi optio reprehenderit', 3, 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architect', '2022-10-30'),
('qui est esse', 3, 'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla', '2022-10-30'),
('eum et est occaecati', 3, 'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit', '2022-10-30');

insert into list_categories (id_post, id_category) values (1, 2), (2, 2), (3, 1);

insert into comments (id_user, content, date) 
values 
(2, 'maiores sed dolores similique labore et inventore et\nquasi temporibus esse sunt id et\neos voluptatem aliquam\naliquid ratione corporis molestiae mollitia quia et magnam dolor', '29-06-06'), 
(1, 'non et atque\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\nquia voluptas consequuntur itaque dolor\net qui rerum deleniti ut occaecati', '29-06-06'), 
(1, 'quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione', '29-06-06');

insert into list_comments (id_post, id_comment) values (1, 1), (1, 2), (2,3);