CREATE TABLE if not exists  usuarios
(
nombre varchar(50) not null,
nickname varchar(50) not null,
pass varchar(20) not null,
correo varchar(50) not null primary key
);

create table if not exists posts
(
id_post int not null auto_increment primary key,
titulo varchar(45),
contenido varchar(200),
id_usuario varchar(50),
 FOREIGN KEY (id_usuario) REFERENCES usuarios(correo)
);

create table if not exists comentarios
(
id_comentario int not null auto_increment primary key,
contenido varchar(200) not null,
id_usuario varchar(50) not null,
id_post int not null,
foreign key (id_usuario) references usuarios(correo),
foreign key (id_post) references posts(id_post)
);


create table if not exists likes
(
id_usuario varchar(50) not null,
id_post int not null,
foreign key (id_usuario) references usuarios(correo),
foreign key (id_post) references posts(id_post),
constraint primaria primary key(id_usuario,id_post)	
);

insert into usuarios(nombre,nickname,pass,correo) values ("John Doe","Doesito","123456","doe@doe.com");
insert into usuarios(nombre,nickname,pass,correo) values ("Pikachu","Pika","123456","pikachu@pokemon.com");
insert into usuarios(nombre,nickname,pass,correo) values ("Charmander","Fosforito","123456","charmander@pokemon.com");
insert into usuarios(nombre,nickname,pass,correo) values ("Goku","Cacaroto","123456","goku@saiyan.com");
insert into usuarios(nombre,nickname,pass,correo) values ("Cindy Nero","SinDinero","123456","cindy@datacredito.com");

insert into post(titulo,contenido,id_usuario) values ("Post1","Lorem Ipsum", "doe@doe.com");
insert into post(titulo,contenido,id_usuario) values ("Post2","Hola Que Hace", "doe@doe.com");
insert into post(titulo,contenido,id_usuario) values ("Post3","Revive a Crinil", "goku@saiyan.com");
insert into post(titulo,contenido,id_usuario) values ("Post4","Pika Pika", "pikachu@pokemon.com");
insert into post(titulo,contenido,id_usuario) values ("Post5","No tengo Dinero", "cindy@datacredito.com");

insert into comentarios(contenido, id_usuario, id_post) values ("Epa!", "cindy@datacredito.com", 3);
insert into comentarios(contenido, id_usuario, id_post) values ("Madura", "goku@saiyan.com", 2);
insert into comentarios(contenido, id_usuario, id_post) values ("No se", "charmander@pokemon.com", 4);
insert into comentarios(contenido, id_usuario, id_post) values ("Yo Tengo", "cindy@datacredito.com", 5);
insert into comentarios(contenido, id_usuario, id_post) values ("Pika!", "pikachu@pokemon.com", 3);

insert into likes(id_usuario,id_post) values ("goku@saiyan.com",1);
insert into likes(id_usuario,id_post) values ("doe@doe.com",1);
insert into likes(id_usuario,id_post) values ("pikachu@pokemon.com",1);
insert into likes(id_usuario,id_post) values ("charmander@pokemon.com",1);
insert into likes(id_usuario,id_post) values ("cindy@datacredito.com",1);

select correo,nombre from usuarios where pass = "123456";
select id_post, titulo from posts where id_usuario = "doe@doe.com";
select id_comentario, id_usuario, contenido from comentarios where id_post = 5;

UPDATE posts SET contenido ='Post creado por el profe' WHERE id_usuario="damanzano@icesi.edu.co​";
DELETE FROM usuarios WHERE substring(nickname,1,1)= "J";