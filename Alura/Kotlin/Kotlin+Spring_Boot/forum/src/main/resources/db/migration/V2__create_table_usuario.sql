create table usuario(
    id bigint not null auto_increment,
    usuario varchar(50) not null,
    email varchar(50)  not null,
    primary key(id)
);

insert into usuario values(1, 'ana da silva', 'ana@email.com');