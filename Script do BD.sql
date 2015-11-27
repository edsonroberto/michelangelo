create database Micchelangelo;
use Micchelangelo;
/*criação das entidades*/
create table funcionario (
login_func varchar(20) not null,
senha_func varchar(15) not null,
primary key (login_func)
);
create table sabor (
id_pizza int not null auto_increment,
sabor_pizza varchar(30) not null,
descricao varchar(250),
primary key (id_pizza)
);
create table cliente (
login_usu varchar(20) not null,
senha_usu varchar(20) not null,
nome_completo varchar(50) not null,
email varchar(50) not null,
telefone varchar(15) not null,
celular varchar(15) not null,
rua varchar(100) not null,
num_residencia varchar(5) not null,
complemento_residencia varchar(10) null,
bairro varchar(100) not null,
cep varchar(9) not null,
primary key (login_usu)
);
create table ingrediente (
id_ingrediente int not null auto_increment,
nome_ingrediente varchar(20) not null,
preco_ingrediente float not null,
primary key (id_ingrediente)
);
create table pizza (
id_pizza int not null auto_increment,
sabor_pizza varchar(30) not null,
descricao varchar(250),
qtdPizza varchar(20) not null,
tamanho_pizza varchar(20) not null,
valor_pizza float not null,
primary key (id_pizza)
);
select *from pizza;
create table pizza_ingrediente (
id_pizza int not null,
id_ingrediente int not null,
foreign key (id_pizza) references pizza(id_pizza),
foreign key (id_ingrediente) references ingrediente(id_ingrediente)
);
create table bebida (
id_bebida int not null auto_increment,
marca_bebida varchar(30) null,
tamanho_bebida varchar(10) null,
valor_unitario float null,
primary key (id_bebida)
);
create table pedido (
id_pedido int not null auto_increment,
login_usu varchar(20) not null,
valor_total float not null,
primary key (id_pedido),
foreign key (login_usu) references cliente(login_usu)
);
create table pedido_pizza (
id_pedido int not null,
id_pizza int not null,
foreign key(id_pedido) references pedido (id_pedido),
foreign key(id_pizza) references pizza (id_pizza)
);
create table pedido_bebida (
id_pedido int not null,
id_bebida int not null,
foreign key(id_pedido) references pedido(id_pedido),
foreign key(id_bebida) references bebida(id_bebida)
);
create table situacao (
id_pedido int not null auto_increment,
mensagem varchar(100) not null,
foreign key (id_pedido) references pedido(id_pedido)
);
/*criação das procedures*/
use micchelangelo;
/*Procedimento para incluir um ingrediente na pizza*/
delimiter $$
create procedure incluirNoCardapio (id_pizza int, id_ingrediente int)
begin
insert into pizza_ingrediente(id_pizza, id_ingrediente)
values(id_pizza, id_ingrediente);
end$$
/*Procedimento para cadastrar um usuario no sistema*/
delimiter $$
create procedure cadastrarUsuario (login varchar(20),senha varchar(20),nome varchar(50),email varchar(100),telefone varchar(15),
celular varchar(15), rua varchar(100), num int, complemento varchar(10), bairro varchar(100),cep varchar(9))
begin
insert into cliente(login_usu, senha_usu, nome_completo,
email, telefone, celular, rua, num_residencia,
complemento_residencia, bairro, cep)
values(login,senha,nome,email,telefone, celular, rua, num, complemento, bairro,cep);
end$$
/* Procedimento para cadastrar uma bebida no sistema */
delimiter $$
create procedure cadastrarBebida(marcabebida varchar(30), tamanhobebida varchar(10), valorunitario float)
begin
insert into bebida(marca_bebida, tamanho_bebida, valor_unitario)
values(marcabebida, tamanhobebida, valorunitario);
end $$
/*Procedimento para cadastrar uma pizza no sistema*/
delimiter $$
create procedure cadastrarPizza (saborpizza varchar(30), descr varchar(250), qtdpizza varchar(20), tamanhopizza varchar(20), valorpizza float)
begin
insert into pizza(sabor_pizza, descricao, qtdPizza, tamanho_pizza, valor_pizza)
values(saborpizza, descr, qtdpizza, tamanhopizza, valorpizza);
end$$
/* Procedimento para cadastrar os sabores de uma pizza no sistema */
delimiter $$
create procedure cadastrarSabor (saborpizza varchar(30), descr varchar(250))
begin
insert into sabor(sabor_pizza, descricao)
values(saborpizza, descr);
end$$
/*Procedimento para cadastrar um ingrediente no sistema*/
delimiter $$
create procedure cadastrarIngrediente (nome_ing varchar(20), preco float)
begin
insert into ingrediente(nome_ingrediente, preco_ingrediente)
values(nome_ing, preco);
end$$
/*Procedimento para o usuario fazer um pedido*/
delimiter $$
create procedure fazerPedido (idpedido int, login varchar(20))
begin
insert into pedido(id_pedido, login_usu, valor_total)
values(idpedido, login, 0.0);
end$$
select *from pedido_pizza;
select *from cliente;
/* Procedimento para adicionar uma pizza ao carrinho */
delimiter $$
create procedure adicionarPizzaNoCarrinho (idpedido int, idpizza int)
begin
insert into pedido_pizza(id_pedido, id_pizza)
values (idpedido, idpizza);
end$$
SELECT *FROM PIZZA;
/* Procedimento para adicionar uma bebida ao carrinho */
delimiter $$
create procedure adicionarBebidaNoCarrinho (idpedido int, idbebida int)
begin
insert into pedido_bebida(id_pedido, id_bebida)
values(idpedido, idbebida);
end$$
/* Procedimento para remover um ingrediente da pizza */
/*delimiter $$
create procedure removerIngrediente (idpedido int, idpizza int, idingrediente int)
begin
select *from pedido ped
inner join pedido_pizza pp
on pp.id_pedido = ped.id_pedido
where pp.id_pedido = idpedido;
if @@rowcount > 0
begin
delete from pizza_ingrediente
where id_pizza = idpizza and id_ingrediente = idingrediente;
end
end$$ */
/* Procedimento para mostrar as pizzas do pedido do usuario */
delimiter $$
create procedure pizzasCarrinho (idpedido int, login varchar(20))
begin
select piz.sabor_pizza as 'Sabor',
piz.qtdPizza as 'Quantidade',
piz.tamanho_pizza as 'Tamanho',
piz.valor_pizza as 'Valor da Pizza',
p.valor_total as 'Valor Total' from pizza piz
inner join pedido_pizza pp
on piz.id_pizza = pp.id_pizza
inner join pedido p
on pp.id_pedido = p.id_pedido
inner join pedido_bebida pb
on p.id_pedido = pb.id_pedido
inner join cliente c
on c.login_usu = p.login_usu
where p.login_usu = login and p.id_pedido = idpedido;
end$$
delimiter $$
create view visaoFuncionario
begin
select c.nome_completo as 'Nome Completo',
c.telefone as 'Telefone',
c.celular as 'Celular,'
c.rua as 'Rua',
c.num_residencia as 'Número',
c.complemento_residencia as 'Complemento', 
c.bairro as 'Bairro',
p.id_pedido as 'Código do Pedido', 
piz.sabor_pizza as 'Sabor Pizza',
piz.qtdPizza as 'Quantidade', 
piz.tamanho_pizza as 'Tamanho',
piz.valor_pizza as 'Valor Unitário',
b.marca_bebida as 'Marca',
b.tamanho_bebida as 'Tamanho da Bebida',
b.valor_unitario as 'Valor Unitário',
p.valor_total as 'Valor Total' from cliente c
inner join pedido p
on p.login_usu = c.login_usu
inner join pizza piz
on piz.
select *from pedido;
select *from bebida;
select *from pizza;
end$$
select *from cliente;
call pizzasCarrinho(2, 'renanvieira');
/* Procedimento para mostrar as bebida do pedido do usuario */
delimiter $$
create procedure bebidasCarrinho (idpedido int, login varchar(20))
begin
select b.marca_bebida as 'Marca',
b.tamanho_bebida as 'Tamanho',
b.valor_unitario as 'Valor Unitário',
p.valor_total as 'Valor Total' from bebida b
inner join pedido_bebida pb
on b.id_bebida = pb.id_bebida
inner join pedido p
on p.id_pedido = pb.id_pedido
inner join cliente c
on c.login_usu = p.login_usu
where p.login_usu = login and p.id_pedido = idpedido;
end$$
/* Procedimento para atualizar o status do pedido para o cliente */
delimiter $$
create procedure atualizarStatus(idpedido int, msg varchar(100))
begin
insert into situacao(id_pedido, mensagem)
values(idpedido, msg);
end$$
/* criação dos gatilhos */
/* Gatilho para decrementar o valor da pizza conforme a retirada de ingredientes*/
delimiter $$
CREATE TRIGGER retirarValorIngrediente
after delete
on pizza_ingrediente
for each row
begin
update pizza
set valor_pizza = valor_pizza - (SELECT preco_ingrediente from ingrediente ing
inner join old.pizza_ingrediente 
on old.id_ingrediente = ing.id_ingrediente
inner join pizza p
on p.id_pizza = old.id_pizza
inner join pedido_pizza pp
on pp.id_pizza = p.id_pizza
inner join pedido ped
on ped.id_pedido = pp.id_pedido);
end$$
/* Gatilho para incrementar o valor do ingrediente na pizza */
DELIMITER $$
CREATE TRIGGER adicionarValorIngrediente
AFTER INSERT
ON pizza_ingrediente
FOR EACH ROW
BEGIN
UPDATE pizza
SET valor_pizza = valor_pizza + (SELECT preco_ingrediente FROM ingrediente ing
INNER JOIN new.pizza_ingrediente 
ON new.id_ingrediente = ing.id_ingrediente
INNER JOIN pizza p
ON p.id_pizza = new.id_pizza
INNER JOIN pedido_pizza pp
ON pp.id_pizza = p.id_pizza
INNER JOIN pedido ped
ON ped.id_pedido = pp.id_pedido);
END$$
/* Gatilho para decrementar o valor do pedido quando uma pizza for removida do pedido */
delimiter $$
create trigger removerPizzaPedido
after delete
on pedido_pizza
for each row
begin
update pedido
set valor_total = valor_total - (select valor_pizza from pizza piz
inner join old.pedido_pizza 
on piz.id_pizza = old.id_pizza
inner join pedido p
on p.id_pedido = old.id_pedido);
end$$
/* Gatilho para incrementar o valor do pedido quando uma pizza for adicionado ao pedido */
delimiter $$
create trigger adicionarPizzaPedido
after insert
on pedido_pizza
for each row
begin
update pedido
set valor_total = valor_total + (select valor_pizza from pizza piz
inner join new.pedido_pizza
on new.id_pizza = piz.id_pizza
inner join pedido p
on p.id_pedido = new.id_pedido);
end$$
/* Gatilho para decrementar o valor do pedido quando uma bebida for retirada do pedido */
delimiter $$
create trigger removerBebidaPedido
after delete
on pedido_bebida
for each row
begin
update pedido
set valor_total = valor_total - (select valor_unitario from bebida b
inner join old.pedido_bebida pb
on old.id_bebida = b.id_bebida
inner join pedido p
on p.id_pedido = old.id_pedido);
end$$
/* Gatilho para incrementar o valor do pedido quando uma bebida for adicionada ao pedido */
delimiter $$
create trigger adicionarBebidaPedido
after insert
on pedido_bebida
for each row
begin
update pedido
set valor_total = valor_total + (select valor_unitario from bebida b
inner join new.pedido_bebida
on new.id_bebida = b.id_bebida
inner join pedido p
on p.id_pedido = new.id_pedido);
end$$
/*cadastro dos clientes pré-registrados*/
call cadastrarUsuario('renanvieira', '12345', 'Renan Brito Vieira',
'renan@micchelangelo.com', '4141-4243', '94141-4243', 'Rua dos Sabias', '32',
null, 'Jardim Limeira', '54546-657');
call cadastrarUsuario('briantong','senha1234','Brian Tong',
'briantong1994@gmail.com','118581-4412', '1198581-4412','rua joao bassinello', '179',
'bloco A','jardim sao paulo','13484-040');
select *from cliente;
/* cadastro das bebidas */
call cadastrarBebida('Guaraná Antártica', '1,5l', 3.50);
call cadastrarBebida('Guaraná Antártica', '2l', 6.70);
call cadastrarBebida('Guaraná Antártica', '3l', 9.20);
call cadastrarBebida('Coca-Cola', '1,5l', 3.70);
call cadastrarBebida('Coca-Cola', '2l', 6.90 );
call cadastrarBebida('Coca-Cola', '3l', 9.50);
call cadastrarBebida('Fanta Laranja', '1,5l', 3.20);
call cadastrarBebida('Fanta Laranja', '2l', 6.30);
call cadastrarBebida('Fanta Laranja', '3l', 8.90);
select *from bebida;
/*cadastro dos ingredientes*/
call cadastrarIngrediente('Atum', 2.00);
call cadastrarIngrediente('Bacon', 2.00);
call cadastrarIngrediente('Brócolis', 1.50);
call cadastrarIngrediente('Catupiry', 1.50);
call cadastrarIngrediente('Cebola', 1.50);
call cadastrarIngrediente('Azeitona', 1.50);
call cadastrarIngrediente('Milho', 1.50);
call cadastrarIngrediente('Mussarela', 1.50);
call cadastrarIngrediente('Frango', 2.00);
call cadastrarIngrediente('Tomate', 1.50);
call cadastrarIngrediente('Pepperoni', 2.00);
call cadastrarIngrediente('Presunto', 1.50);
select *from ingrediente;
/* cadastro do funcionário pré-registrado */
insert into funcionario(login_func, senha_func)
values('admin', 'admin');
select *from funcionario;
/* Cadastro das pizzas meia brotinho */
call cadastrarPizza('Atum', 'Massa caseira regada com molho de tomates frescos e camada
generosa de mussarela combinada com deliciosos pedaços de atum em
conserva e orégano polvilhado.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Bacon', 'Massa caseira regada com molho de tomates frescos e excelente
mistura de bacon com mussarela e polvilhados de orégano.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Baiana', 'Agradável combinação de mussarela ralada, com pedaços de
calabresa e uma pitada de pimenta e orégano sobre nosso incrível molho de
tomates frescos.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Brócolis', 'Impecável união de brócolis frescos, bacon em fatias, catupiry
cremoso e azeitonas pretas em pedaços sobre uma ampla camada de
mussarela e maravilhoso molho de tomates frescos.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Calabresa', 'Massa caseira banhada de incrível molho de tomates, coberto
por abundante camada de mussarela, pedaços nobres de calabresa e cebola
rodelas.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Escarola', 'Extraordinária escarola refogada com alho e bacon, disposta
sobre grandiosa camada de mussarela e molho de tomates.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Frango com catupiry', 'Combinação perfeita de frango desfiado com catupiry
cremoso sobre grandiosa camada de mussarela ralada e molho de tomates.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Gorgonzola', 'Massa caseira regada de molho de tomates frescos, incrível
camada de mussarela, pedaços magnificos de gorgonzola e tomates frescos.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Lombo com catupiry', 'Impecável combinação de lombo em fatias com
catupiry cremoso sobre ampla camada de mussarela e delicioso molho de
tomates.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Marguerita', 'Massa caseira banhada de molho de tomates frescos,
magnífica camada de mussarela, fatias nobres de tomate e folhas de
manjericão.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Mussarela', 'Sublime camada de mussarela, com deliciosas rodelas de
tomate e orégano polvilhado.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Pepperoni', 'Primorosas fatias de pepperoni sobre primorosa camada de
mussarela e molho de tomates.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Portuguesa', 'Incrível mistura de presunto em cubos, cebola em fatias, ovos
cozidos, pedaços de azeitonas pretas e orégano sobre ampla camada de
mussarela ralada e íncrivel molho de tomates frescos.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Quatro queijos', 'Massa caseira banhada de delicioso molho de tomates
frescos e bela combinação de mussarela, provolone, parmesão e catupiry.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Siciliana', 'Primorosa camada de mussarela e molho de tomates sob
magnífica harmonia de champignon fatiado, bacon em fatias, pimentão e
azeitonas pretas em pedaços.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Banana', 'Deliciosa camada de leite condensado coberta por fatias suculentas de
bananas e polvilhados com açúcar e canela.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Brigadeiro', 'Camada abundante de delicioso brigadeiro coberto com chocolate
granulado.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Chocolate com Morango', 'Nobre camada de chocolate sob pedaços suculentos de
morango.', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Confete', 'Primorosa camada de chocolate coberta com confetes', 'Meia', 'Brotinho', 6.25);
call cadastrarPizza('Romeu e Julieta', 'Combinação perfeita de deliciosa camada de mussarela com
fatias de goiabada.', 'Meia', 'Brotinho', 6.25);
/* cadastro das pizzas inteira brotinho*/
call cadastrarPizza('Atum', 'Massa caseira regada com molho de tomates frescos e camada
generosa de mussarela combinada com deliciosos pedaços de atum em
conserva e orégano polvilhado.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Bacon', 'Massa caseira regada com molho de tomates frescos e excelente
mistura de bacon com mussarela e polvilhados de orégano.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Baiana', 'Agradável combinação de mussarela ralada, com pedaços de
calabresa e uma pitada de pimenta e orégano sobre nosso incrível molho de
tomates frescos.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Brócolis', 'Impecável união de brócolis frescos, bacon em fatias, catupiry
cremoso e azeitonas pretas em pedaços sobre uma ampla camada de
mussarela e maravilhoso molho de tomates frescos.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Calabresa', 'Massa caseira banhada de incrível molho de tomates, coberto
por abundante camada de mussarela, pedaços nobres de calabresa e cebola
rodelas.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Escarola', 'Extraordinária escarola refogada com alho e bacon, disposta
sobre grandiosa camada de mussarela e molho de tomates.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Frango com catupiry', 'Combinação perfeita de frango desfiado com catupiry
cremoso sobre grandiosa camada de mussarela ralada e molho de tomates.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Gorgonzola', 'Massa caseira regada de molho de tomates frescos, incrível
camada de mussarela, pedaços magnificos de gorgonzola e tomates frescos.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Lombo com catupiry', 'Impecável combinação de lombo em fatias com
catupiry cremoso sobre ampla camada de mussarela e delicioso molho de
tomates.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Marguerita', 'Massa caseira banhada de molho de tomates frescos,
magnífica camada de mussarela, fatias nobres de tomate e folhas de
manjericão.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Mussarela', 'Sublime camada de mussarela, com deliciosas rodelas de
tomate e orégano polvilhado.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Pepperoni', 'Primorosas fatias de pepperoni sobre primorosa camada de
mussarela e molho de tomates.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Portuguesa', 'Incrível mistura de presunto em cubos, cebola em fatias, ovos
cozidos, pedaços de azeitonas pretas e orégano sobre ampla camada de
mussarela ralada e íncrivel molho de tomates frescos.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Quatro queijos', 'Massa caseira banhada de delicioso molho de tomates
frescos e bela combinação de mussarela, provolone, parmesão e catupiry.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Siciliana', 'Primorosa camada de mussarela e molho de tomates sob
magnífica harmonia de champignon fatiado, bacon em fatias, pimentão e
azeitonas pretas em pedaços.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Banana', 'Deliciosa camada de leite condensado coberta por fatias suculentas de
bananas e polvilhados com açúcar e canela.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Brigadeiro', 'Camada abundante de delicioso brigadeiro coberto com chocolate
granulado.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Chocolate com Morango', 'Nobre camada de chocolate sob pedaços suculentos de
morango.', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Confete', 'Primorosa camada de chocolate coberta com confetes', 'Inteira', 'Brotinho', 12.50);
call cadastrarPizza('Romeu e Julieta', 'Combinação perfeita de deliciosa camada de mussarela com
fatias de goiabada.', 'Inteira', 'Brotinho', 12.50);
/* Cadastro das pizzas meia tamanho tradicional */
call cadastrarPizza('Atum', 'Massa caseira regada com molho de tomates frescos e camada
generosa de mussarela combinada com deliciosos pedaços de atum em
conserva e orégano polvilhado.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Bacon', 'Massa caseira regada com molho de tomates frescos e excelente
mistura de bacon com mussarela e polvilhados de orégano.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Baiana', 'Agradável combinação de mussarela ralada, com pedaços de
calabresa e uma pitada de pimenta e orégano sobre nosso incrível molho de
tomates frescos.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Brócolis', 'Impecável união de brócolis frescos, bacon em fatias, catupiry
cremoso e azeitonas pretas em pedaços sobre uma ampla camada de
mussarela e maravilhoso molho de tomates frescos.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Calabresa', 'Massa caseira banhada de incrível molho de tomates, coberto
por abundante camada de mussarela, pedaços nobres de calabresa e cebola
rodelas.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Escarola', 'Extraordinária escarola refogada com alho e bacon, disposta
sobre grandiosa camada de mussarela e molho de tomates.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Frango com catupiry', 'Combinação perfeita de frango desfiado com catupiry
cremoso sobre grandiosa camada de mussarela ralada e molho de tomates.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Gorgonzola', 'Massa caseira regada de molho de tomates frescos, incrível
camada de mussarela, pedaços magnificos de gorgonzola e tomates frescos.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Lombo com catupiry', 'Impecável combinação de lombo em fatias com
catupiry cremoso sobre ampla camada de mussarela e delicioso molho de
tomates.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Marguerita', 'Massa caseira banhada de molho de tomates frescos,
magnífica camada de mussarela, fatias nobres de tomate e folhas de
manjericão.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Mussarela', 'Sublime camada de mussarela, com deliciosas rodelas de
tomate e orégano polvilhado.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Pepperoni', 'Primorosas fatias de pepperoni sobre primorosa camada de
mussarela e molho de tomates.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Portuguesa', 'Incrível mistura de presunto em cubos, cebola em fatias, ovos
cozidos, pedaços de azeitonas pretas e orégano sobre ampla camada de
mussarela ralada e íncrivel molho de tomates frescos.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Quatro queijos', 'Massa caseira banhada de delicioso molho de tomates
frescos e bela combinação de mussarela, provolone, parmesão e catupiry.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Siciliana', 'Primorosa camada de mussarela e molho de tomates sob
magnífica harmonia de champignon fatiado, bacon em fatias, pimentão e
azeitonas pretas em pedaços.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Banana', 'Deliciosa camada de leite condensado coberta por fatias suculentas de
bananas e polvilhados com açúcar e canela.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Brigadeiro', 'Camada abundante de delicioso brigadeiro coberto com chocolate
granulado.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Chocolate com Morango', 'Nobre camada de chocolate sob pedaços suculentos de
morango.', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Confete', 'Primorosa camada de chocolate coberta com confetes', 'Meia', 'Tradicional', 7.75);
call cadastrarPizza('Romeu e Julieta', 'Combinação perfeita de deliciosa camada de mussarela com
fatias de goiabada.', 'Meia', 'Tradicional', 7.75);
/* Cadastro das pizzas inteira tamanho tradicional */
call cadastrarPizza('Atum', 'Massa caseira regada com molho de tomates frescos e camada
generosa de mussarela combinada com deliciosos pedaços de atum em
conserva e orégano polvilhado.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Bacon', 'Massa caseira regada com molho de tomates frescos e excelente
mistura de bacon com mussarela e polvilhados de orégano.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Baiana', 'Agradável combinação de mussarela ralada, com pedaços de
calabresa e uma pitada de pimenta e orégano sobre nosso incrível molho de
tomates frescos.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Brócolis', 'Impecável união de brócolis frescos, bacon em fatias, catupiry
cremoso e azeitonas pretas em pedaços sobre uma ampla camada de
mussarela e maravilhoso molho de tomates frescos.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Calabresa', 'Massa caseira banhada de incrível molho de tomates, coberto
por abundante camada de mussarela, pedaços nobres de calabresa e cebola
rodelas.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Escarola', 'Extraordinária escarola refogada com alho e bacon, disposta
sobre grandiosa camada de mussarela e molho de tomates.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Frango com catupiry', 'Combinação perfeita de frango desfiado com catupiry
cremoso sobre grandiosa camada de mussarela ralada e molho de tomates.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Gorgonzola', 'Massa caseira regada de molho de tomates frescos, incrível
camada de mussarela, pedaços magnificos de gorgonzola e tomates frescos.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Lombo com catupiry', 'Impecável combinação de lombo em fatias com
catupiry cremoso sobre ampla camada de mussarela e delicioso molho de
tomates.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Marguerita', 'Massa caseira banhada de molho de tomates frescos,
magnífica camada de mussarela, fatias nobres de tomate e folhas de
manjericão.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Mussarela', 'Sublime camada de mussarela, com deliciosas rodelas de
tomate e orégano polvilhado.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Pepperoni', 'Primorosas fatias de pepperoni sobre primorosa camada de
mussarela e molho de tomates.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Portuguesa', 'Incrível mistura de presunto em cubos, cebola em fatias, ovos
cozidos, pedaços de azeitonas pretas e orégano sobre ampla camada de
mussarela ralada e íncrivel molho de tomates frescos.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Quatro queijos', 'Massa caseira banhada de delicioso molho de tomates
frescos e bela combinação de mussarela, provolone, parmesão e catupiry.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Siciliana', 'Primorosa camada de mussarela e molho de tomates sob
magnífica harmonia de champignon fatiado, bacon em fatias, pimentão e
azeitonas pretas em pedaços.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Banana', 'Deliciosa camada de leite condensado coberta por fatias suculentas de
bananas e polvilhados com açúcar e canela.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Brigadeiro', 'Camada abundante de delicioso brigadeiro coberto com chocolate
granulado.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Chocolate com Morango', 'Nobre camada de chocolate sob pedaços suculentos de
morango.', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Confete', 'Primorosa camada de chocolate coberta com confetes', 'Inteira', 'Tradicional', 17.50);
call cadastrarPizza('Romeu e Julieta', 'Combinação perfeita de deliciosa camada de mussarela com
fatias de goiabada.', 'Inteira', 'Tradicional', 17.50);
select *from pizza;
/* cadastro dos sabores de pizzas */
call cadastrarSabor('Atum','Massa caseira regada com molho de tomates frescos e camada
generosa de mussarela combinada com deliciosos pedaços de atum em
conserva e orégano polvilhado.');
call cadastrarSabor('Bacon', 'Massa caseira regada com molho de tomates frescos e excelente
mistura de bacon com mussarela e polvilhados de orégano.');
call cadastrarSabor('Baiana', 'Agradável combinação de mussarela ralada, com pedaços de
calabresa e uma pitada de pimenta e orégano sobre nosso incrível molho de
tomates frescos.');
call cadastrarSabor('Brócolis', 'Impecável união de brócolis frescos, bacon em fatias, catupiry
cremoso e azeitonas pretas em pedaços sobre uma ampla camada de
mussarela e maravilhoso molho de tomates frescos.');
call cadastrarSabor('Calabresa', 'Massa caseira banhada de incrível molho de tomates, coberto
por abundante camada de mussarela, pedaços nobres de calabresa e cebola
rodelas.');
call cadastrarSabor('Escarola', 'Extraordinária escarola refogada com alho e bacon, disposta
sobre grandiosa camada de mussarela e molho de tomates.');
call cadastrarSabor('Frango com catupiry', 'Combinação perfeita de frango desfiado com catupiry
cremoso sobre grandiosa camada de mussarela ralada e molho de tomates.');
call cadastrarSabor('Gorgonzola', 'Massa caseira regada de molho de tomates frescos, incrível
camada de mussarela, pedaços magnificos de gorgonzola e tomates frescos.');
call cadastrarSabor('Lombo com catupiry', 'Impecável combinação de lombo em fatias com
catupiry cremoso sobre ampla camada de mussarela e delicioso molho de
tomates.');
call cadastrarSabor('Marguerita', 'Massa caseira banhada de molho de tomates frescos,
magnífica camada de mussarela, fatias nobres de tomate e folhas de
manjericão.');
call cadastrarSabor('Mussarela', 'Sublime camada de mussarela, com deliciosas rodelas de
tomate e orégano polvilhado.');
call cadastrarSabor('Pepperoni', 'Primorosas fatias de pepperoni sobre primorosa camada de
mussarela e molho de tomates.');
call cadastrarSabor('Portuguesa', 'Incrível mistura de presunto em cubos, cebola em fatias, ovos
cozidos, pedaços de azeitonas pretas e orégano sobre ampla camada de
mussarela ralada e íncrivel molho de tomates frescos.');
call cadastrarSabor('Quatro queijos', 'Massa caseira banhada de delicioso molho de tomates
frescos e bela combinação de mussarela, provolone, parmesão e catupiry.');
call cadastrarSabor('Siciliana', 'Primorosa camada de mussarela e molho de tomates sob
magnífica harmonia de champignon fatiado, bacon em fatias, pimentão e
azeitonas pretas em pedaços.');
call cadastrarSabor('Banana', 'Deliciosa camada de leite condensado coberta por fatias suculentas de
bananas e polvilhados com açúcar e canela.');
call cadastrarSabor('Brigadeiro', 'Camada abundante de delicioso brigadeiro coberto com chocolate
granulado.');
call cadastrarSabor('Chocolate com Morango', 'Nobre camada de chocolate sob pedaços suculentos de
morango.');
call cadastrarSabor('Confete', 'Primorosa camada de chocolate coberta com confetes');
call cadastrarSabor('Romeu e Julieta', 'Combinação perfeita de deliciosa camada de mussarela com
fatias de goiabada.');
select *from sabor;
/*Relacionamento dos sabores de pizzas com os ingredientes*/
/* atum */
call incluirNoCardapio(1, 8);
call incluirNoCardapio(21, 8);
call incluirNoCardapio(41, 8);
call incluirNoCardapio(61, 8);
/* bacon */
call incluirNoCardapio(2, 2);
call incluirNoCardapio(22, 2);
call incluirNoCardapio(42, 2);
call incluirNoCardapio(62, 2);
call incluirNoCardapio(2, 8);
call incluirNoCardapio(22, 8);
call incluirNoCardapio(42, 8);
call incluirNoCardapio(62, 8);
/* baiana */
call incluirNoCardapio(3, 8);
call incluirNoCardapio(23, 8);
call incluirNoCardapio(43, 8);
call incluirNoCardapio(63, 8);
/* brocolis */
call incluirNoCardapio(4, 2);
call incluirNoCardapio(24, 2);
call incluirNoCardapio(44, 2);
call incluirNoCardapio(64, 2);
call incluirNoCardapio(4, 3);
call incluirNoCardapio(24, 3);
call incluirNoCardapio(44, 3);
call incluirNoCardapio(64, 3);
call incluirNoCardapio(4, 4);
call incluirNoCardapio(24, 4);
call incluirNoCardapio(44, 4);
call incluirNoCardapio(64, 4);
call incluirNoCardapio(4, 6);
call incluirNoCardapio(24, 6);
call incluirNoCardapio(44, 6);
call incluirNoCardapio(64, 6);
call incluirNoCardapio(4, 8);
call incluirNoCardapio(24, 8);
call incluirNoCardapio(44, 8);
call incluirNoCardapio(64, 8);
/* calabresa */
call incluirNoCardapio(5, 8);
call incluirNoCardapio(25, 8);
call incluirNoCardapio(45, 8);
call incluirNoCardapio(65, 8);
call incluirNoCardapio(5, 5);
call incluirNoCardapio(25, 5);
call incluirNoCardapio(45, 5);
call incluirNoCardapio(65, 5);
/* escarola */
call incluirNoCardapio(6, 8);
call incluirNoCardapio(26, 8);
call incluirNoCardapio(46, 8);
call incluirNoCardapio(66, 8);
call incluirNoCardapio(6, 2);
call incluirNoCardapio(26, 2);
call incluirNoCardapio(46, 2);
call incluirNoCardapio(66, 2);
/* frango com catupiry */
call incluirNoCardapio(7, 8);
call incluirNoCardapio(27, 8);
call incluirNoCardapio(47, 8);
call incluirNoCardapio(67, 8);
call incluirNoCardapio(7, 4);
call incluirNoCardapio(27, 4);
call incluirNoCardapio(47, 4);
call incluirNoCardapio(67, 4);
/* gorgonzola */
call incluirNoCardapio(8, 8);
call incluirNoCardapio(28, 8);
call incluirNoCardapio(48, 8);
call incluirNoCardapio(68, 8);
call incluirNoCardapio(8, 10);
call incluirNoCardapio(28, 10);
call incluirNoCardapio(48, 10);
call incluirNoCardapio(68, 10);
/* lombo com catupiry */
call incluirNoCardapio(9, 4);
call incluirNoCardapio(29, 4);
call incluirNoCardapio(49, 4);
call incluirNoCardapio(69, 4);
call incluirNoCardapio(9, 8);
call incluirNoCardapio(29, 8);
call incluirNoCardapio(49, 8);
call incluirNoCardapio(69, 8);
/* marguerita */
call incluirNoCardapio(10, 8);
call incluirNoCardapio(30, 8);
call incluirNoCardapio(50, 8);
call incluirNoCardapio(70, 8);
call incluirNoCardapio(10, 10);
call incluirNoCardapio(30, 10);
call incluirNoCardapio(50, 10);
call incluirNoCardapio(70, 10);
/* mussarela */
call incluirNoCardapio(11, 8);
call incluirNoCardapio(31, 8);
call incluirNoCardapio(51, 8);
call incluirNoCardapio(71, 8);
call incluirNoCardapio(11, 10);
call incluirNoCardapio(31, 10);
call incluirNoCardapio(51, 10);
call incluirNoCardapio(71, 10);
/* pepperoni */
call incluirNoCardapio(12, 8);
call incluirNoCardapio(32, 8);
call incluirNoCardapio(52, 8);
call incluirNoCardapio(72, 8);
call incluirNoCardapio(12, 11);
call incluirNoCardapio(32, 11);
call incluirNoCardapio(52, 11);
call incluirNoCardapio(72, 11);
/* portuguesa */
call incluirNoCardapio(13, 5);
call incluirNoCardapio(33, 5);
call incluirNoCardapio(53, 5);
call incluirNoCardapio(73, 5);
call incluirNoCardapio(13, 6);
call incluirNoCardapio(33, 6);
call incluirNoCardapio(53, 6);
call incluirNoCardapio(73, 6);
call incluirNoCardapio(13, 8);
call incluirNoCardapio(33, 8);
call incluirNoCardapio(53, 8);
call incluirNoCardapio(73, 8);
call incluirNoCardapio(13, 12);
call incluirNoCardapio(33, 12);
call incluirNoCardapio(53, 12);
call incluirNoCardapio(73, 12);
/* quatros queijos */
call incluirNoCardapio(14, 4);
call incluirNoCardapio(34, 4);
call incluirNoCardapio(54, 4);
call incluirNoCardapio(74, 4);
call incluirNoCardapio(14, 8);
call incluirNoCardapio(34, 8);
call incluirNoCardapio(54, 8);
call incluirNoCardapio(74, 8);
/* siciliana */
call incluirNoCardapio(15, 8);
call incluirNoCardapio(35, 8);
call incluirNoCardapio(55, 8);
call incluirNoCardapio(75, 8);
call incluirNoCardapio(15, 2);
call incluirNoCardapio(35, 2);
call incluirNoCardapio(55, 2);
call incluirNoCardapio(75, 2);
call incluirNoCardapio(15, 6);
call incluirNoCardapio(35, 6);
call incluirNoCardapio(55, 6);
call incluirNoCardapio(75, 6);
/* banana */
/*call incluirNoCardapio(16, );
call incluirNoCardapio(36, );
call incluirNoCardapio(56, );
call incluirNoCardapio(76, );*/
/* brigadeiro */
/*call incluirNoCardapio(17, );
call incluirNoCardapio(37, );
call incluirNoCardapio(57, );
call incluirNoCardapio(77, );*/
/* chocolate com morango */
/*call incluirNoCardapio(18, );
call incluirNoCardapio(38, );
call incluirNoCardapio(58, );
call incluirNoCardapio(78, );*/
/* confete */
/*call incluirNoCardapio(19, );
call incluirNoCardapio(39, );
call incluirNoCardapio(59, );
call incluirNoCardapio(79, );*/
select *from cliente;
/* romeu e julieta */
call incluirNoCardapio(20, 8);
call incluirNoCardapio(40, 8);
call incluirNoCardapio(60, 8);
call incluirNoCardapio(80, 8);
select *from pizza_ingrediente;
select * from pizza where id_pizza in (4, 9);
-- Increment de id_pedido