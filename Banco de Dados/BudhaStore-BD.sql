create database budha;
use budha;

create table cliente (
  pk_cliente int primary key auto_increment,
  nome_cliente varchar(120) not null,
  telefone_cliente varchar(45),
  celular_cliente varchar(45),
  cpf_cliente varchar(45) not null unique,
  rg_cliente varchar(45),
  datanasc_cliente date null,
  email_cliente varchar(45),
  rua_cliente varchar(120),
  bairro_cliente varchar(120),
  complemento_cliente varchar(120),
  cep_cliente varchar(45),
  numero_cliente varchar(45)
);

create table funcionario (
  pk_funcionario int primary key auto_increment,
  nome_funcionario varchar(120) not null,
  telefone_funcionario varchar(45),
  celular_funcionario varchar(45) not null,
  cpf_funcionario varchar(45) unique not null,
  email_funcionario varchar(120),
  usuario_funcionario varchar(45) unique not null,
  senha_funcionario varchar(45) not null,
  datanasc_funcionario varchar(45),
  rg_funcionario varchar(45) not null,
  cargo_funcionario varchar(45) not null,
  rua_funcionario varchar(120),
  bairro_funcionario varchar(120),
  complemento_funcionario varchar(120),
  cep_funcionario varchar(45),
  numero_funcionario varchar(45)
);

create table condicional (
  pk_condicional int primary key auto_increment,
  tipo_condicional varchar(120) not null,
  quantidade_condicional int not null,
  data_envio_condicional date not null,
  data_devolucao_condicional date not null,
  fk_cliente int not null,
  fk_funcionario int not null,

    foreign key (fk_cliente)
    references cliente (pk_cliente),

    foreign key (fk_funcionario)
    references funcionario (pk_funcionario)
);

create table fornecedor (
  pk_fornecedor int primary key auto_increment,
  razao_social_fornecedor varchar(200) not null,
  nome_fantasia_fornecedor varchar(200) not null,
  cnpj_fornecedor varchar(45) not null,
  email_fornecedor varchar(120) not null,
  telefone_fornecedor varchar(45),
  celular_fornecedor varchar(45),
  datacadastro_fornecedor date not null);

create table compra (
  pk_compra int primary key auto_increment,
  formapag_compra varchar(45) not null,
  entrega_compra date null,
  quantidade_compra int not null,
  data_compra date not null,
  valor_compra decimal(13,2) not null,
  hora_compra time not null,
 
  fk_funcionario int not null,
    foreign key (fk_funcionario)
    references funcionario (pk_funcionario),
  
  fk_fornecedor int not null,
    foreign key (fk_fornecedor)
    references fornecedor (pk_fornecedor)
);

create table produto (
  pk_produto int primary key auto_increment,
  codigo_barra varchar(45) not null,
  nome_produto varchar(120) not null,
  marca_produto varchar(120) not null,
  tipo_produto varchar(45) not null,
  tamanho_produto varchar(45),
  genero_produto enum('M', 'F', 'U') not null,
  material_produto varchar(125) not null,
  valor_produto decimal null,
  descricao_produto varchar(140),
  quantidade_produto int null,
  fornecedor_idfornecedor int not null,
  funcionario_idfuncionario int not null,
   fk_produto int not null,
   fk_compra int not null,
    foreign key (fk_produto)
    references produto (pk_produto),

    foreign key (fk_compra)
    references compra (pk_compra));

create table venda (
  pk_venda int primary key auto_increment,
  valor_venda decimal(13,2) not null,
  desconto_venda int null,
  forma_venda varchar(125) not null,
  data_venda date not null,
  hora_venda time not null,
  fk_funcionario int not null,
    foreign key (fk_funcionario)
    references funcionario (pk_funcionario) );

create table caixa (
  pk_caixa int primary key auto_increment,
  data_caixa date not null,
  horaaberto_caixa time not null,
  horafechado_caixa time ,
  saldoinicial_caixa decimal(13,2) not null,
  saldoatual_caixa decimal(13,2),
  recebimento_caixa decimal(13,2),
  pagamento_caixa decimal(13,2),
  status_caixa enum('Aberto', 'Fechado') not null,
  fk_funcionario int not null,
  foreign key (fk_funcionario) references Funcionario (pk_funcionario)
);

create table despesa (
  pk_despesa int primary key auto_increment,
  descricao_despesa varchar(140) not null,
  datag_despesa date null,
  datav_despesa date not null,
  tipo_despesa varchar(45),
  valor_despesa decimal(13,2) not null,
  fk_caixa int not null,
    foreign key (fk_caixa)
    references caixa (pk_caixa)
);
-- TABELAS N para N
create table venda_produto (
  pk_venda_produto int primary key auto_increment,
  quantidade_venda_produto int not null,
 fk_produto int not null,
	foreign key (fk_produto) 
	references produto (pk_produto),

  fk_venda int not null,
	foreign key (fk_venda) 
	references venda (pk_venda) 
);

create table venda_condicional (
  pk_venda_condicional int primary key auto_increment,
  fk_venda int not null,
  foreign key (fk_venda) references venda (pk_venda), 

fk_condicional int not null,
foreign key (fk_condicional) references condicional (pk_condicional) 
	 );

create table condicional_produto (
  pk_condicionalproduto int primary key auto_increment,
   
     fk_produto int not null,
	foreign key (fk_produto) 
	references produto (pk_produto),

  fk_Condicional int not null,
	foreign key (fk_Condicional) 
	references Condicional (pk_Condicional)
   );

create table compra_produto (
  quantidade_compra_produto int not null,
  pk_compra_produto int primary key auto_increment,
  fk_produto int not null,
	foreign key (fk_produto) 
	references produto (pk_produto),
  fk_Compra int not null,
	foreign key (fk_Compra) 
	references Compra (pk_Compra)
);


-- drop database budha;