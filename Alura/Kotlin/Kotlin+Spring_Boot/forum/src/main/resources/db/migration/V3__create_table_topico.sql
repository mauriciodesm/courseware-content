create table topico(
    id bigint not null auto_increment,
    titulo varchar(50),
    mensagem varchar(400) ,
    data_criacao datetime not null,
    curso_id bigint not null,
    autor_id bigint not null,
    status varchar(20) not null,
    primary key(id),
    foreign key(curso_id) references curso(id),
    foreign key(autor_id) references usuario(id)
);

