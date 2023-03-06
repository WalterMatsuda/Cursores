create sequence if not exists fillfactor_seq ; 
create table if not exists fillfactor( 
    id bigint default nextval('fillfactor_seq'::regclass)  , 
    descricao varchar(120) ,
    nome varchar(60) , 
    d_datacadastro date default current_date , 
    t_horacadastro time default current_time ,
    constraint fillfactor_pkey primary key (id) 
) with (fillfactor = 70 );

create table if not exists fillfactor01(constraint fillfactor01_chk check( date_part('month' , d_datacadastro ) = 1 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor02(constraint fillfactor02_chk check( date_part('month' , d_datacadastro ) = 2 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor03(constraint fillfactor03_chk check( date_part('month' , d_datacadastro ) = 3 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor04(constraint fillfactor04_chk check( date_part('month' , d_datacadastro ) = 4 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor05(constraint fillfactor05_chk check( date_part('month' , d_datacadastro ) = 5 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor06(constraint fillfactor06_chk check( date_part('month' , d_datacadastro ) = 6 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor07(constraint fillfactor07_chk check( date_part('month' , d_datacadastro ) = 7 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor08(constraint fillfactor08_chk check( date_part('month' , d_datacadastro ) = 8 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor09(constraint fillfactor09_chk check( date_part('month' , d_datacadastro ) = 9 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor10(constraint fillfactor10_chk check( date_part('month' , d_datacadastro ) = 10 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor11(constraint fillfactor11_chk check( date_part('month' , d_datacadastro ) = 11 ) ) inherits(fillfactor) with (fillfactor = 70);
create table if not exists fillfactor12(constraint fillfactor12_chk check( date_part('month' , d_datacadastro ) = 12 ) ) inherits(fillfactor) with (fillfactor = 70);

create or replace function func_trg_partioninmgni()
returns trigger as 
$function$
    BEGIN 
        if tg_op ='UPDATE' and date_part('month' , NEW.d_datacadastro) <> date_part('month' , OLD.d_datacadastro) then 
        case when date_part('month' , OLD.d_datacadastro ) = 1 then delete from fillfactor01 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 2 then delete from fillfactor02 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 3 then delete from fillfactor03 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 4 then delete from fillfactor04 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 5 then delete from fillfactor05 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 6 then delete from fillfactor06 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 7 then delete from fillfactor07 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 8 then delete from fillfactor08 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 9 then delete from fillfactor09 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 10 then delete from fillfactor10 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 11 then delete from fillfactor11 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 12 then delete from fillfactor12 where id = OLD.id ; 
        else return null  ;end case;
             insert into fillfactor values(new.*);
        return null ; 

        end if ; 
        raise notice  '%',NEW.d_datacadastro;
        

        

        if tg_op='INSERT' then 
        case when date_part('month' , NEW.d_datacadastro ) = 1 then insert into fillfactor01 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 2 then insert into fillfactor02 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 3 then insert into fillfactor03 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 4 then insert into fillfactor04 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 5 then insert into fillfactor05 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 6 then insert into fillfactor06 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 7 then insert into fillfactor07 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 8 then insert into fillfactor08 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 9 then insert into fillfactor09 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 10 then insert into fillfactor10 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 11 then insert into fillfactor11 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 12 then insert into fillfactor12 values(new.*);
        else return null  ;end case; 
        return null;
        end if ; 

        if tg_op='DELETE' then 
        case when date_part('month' , old.d_datacadastro ) = 1 then delete from fillfactor01 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 2 then delete from fillfactor02 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 3 then delete from fillfactor03 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 4 then delete from fillfactor04 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 5 then delete from fillfactor05 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 6 then delete from fillfactor06 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 7 then delete from fillfactor07 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 8 then delete from fillfactor08 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 9 then delete from fillfactor09 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 10 then delete from fillfactor10 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 11 then delete from fillfactor11 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 12 then delete from fillfactor12 where id = OLD.id;
        else return null  ;end case ; 
        return null;
        end if ; 

        return null ; 
    END; 

$function$ 
cost 5 
language plpgsql;
--


create or replace function func_trg_partioninmgni()
returns trigger as 
$function$
    BEGIN 

        if tg_op='INSERT' then 
        case when date_part('month' , NEW.d_datacadastro ) = 1 then insert into fillfactor01 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 2 then insert into fillfactor02 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 3 then insert into fillfactor03 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 4 then insert into fillfactor04 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 5 then insert into fillfactor05 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 6 then insert into fillfactor06 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 7 then insert into fillfactor07 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 8 then insert into fillfactor08 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 9 then insert into fillfactor09 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 10 then insert into fillfactor10 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 11 then insert into fillfactor11 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 12 then insert into fillfactor12 values(new.*);
        else return null  ;end case; 
        return null;
        end if ; 
       
    END; 

$function$ 
cost 5 
language plpgsql;

--


create or replace function func_trg_partioninmgnu()
returns trigger as 
$function$
    BEGIN 
        if tg_op ='UPDATE' and date_part('month' , NEW.d_datacadastro) <> date_part('month' , OLD.d_datacadastro) then 
        case when date_part('month' , OLD.d_datacadastro ) = 1 then delete from fillfactor01 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 2 then delete from fillfactor02 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 3 then delete from fillfactor03 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 4 then delete from fillfactor04 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 5 then delete from fillfactor05 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 6 then delete from fillfactor06 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 7 then delete from fillfactor07 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 8 then delete from fillfactor08 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 9 then delete from fillfactor09 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 10 then delete from fillfactor10 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 11 then delete from fillfactor11 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 12 then delete from fillfactor12 where id = OLD.id ; 
        else return null  ;end case;
             insert into fillfactor values(new.*);
        return null ; 
        else 
            case when date_part('month' , NEW.d_datacadastro ) = 1 then update fillfactor01 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 2 then update fillfactor02 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 3 then update fillfactor03 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 4 then update fillfactor04 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 5 then update fillfactor05 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 6 then update fillfactor06 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 7 then update fillfactor07 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 8 then update fillfactor08 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 9 then update fillfactor09 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 10 then update fillfactor10 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 11 then update fillfactor11 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 12 then update fillfactor12 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 else return null ; end case ; 
                 return null ;

        end if ; 
        raise notice  '%',NEW.d_datacadastro;
        
        return null ; 
    END; 

$function$ 
cost 5 
language plpgsql;


create or replace function func_trg_partioninmgnd()
returns trigger as 
$function$
    BEGIN 
        if tg_op='DELETE' then 
        case when date_part('month' , old.d_datacadastro ) = 1 then delete from fillfactor01 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 2 then delete from fillfactor02 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 3 then delete from fillfactor03 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 4 then delete from fillfactor04 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 5 then delete from fillfactor05 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 6 then delete from fillfactor06 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 7 then delete from fillfactor07 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 8 then delete from fillfactor08 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 9 then delete from fillfactor09 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 10 then delete from fillfactor10 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 11 then delete from fillfactor11 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 12 then delete from fillfactor12 where id = OLD.id;
        else return null  ;end case ; 
        return null;
        end if ; 
        
        return null ; 
    END; 

$function$ 
cost 5 
language plpgsql;

create or replace trigger trg_partitionmngi 
before insert
on fillfactor
for each row 
execute function func_trg_partioninmgni();

create or replace trigger trg_partitionmngu 
before update
on fillfactor
for each row 
execute function func_trg_partioninmgnu();

create or replace trigger trg_partitionmngd 
before delete 
on fillfactor
for each row 
execute function func_trg_partioninmgnd();

create index  d_datacadastro_fillfactor01 on fillfactor01(d_datacadastro);
create index  d_datacadastro_fillfactor02 on fillfactor02(d_datacadastro);
create index  d_datacadastro_fillfactor03 on fillfactor03(d_datacadastro);
create index  d_datacadastro_fillfactor04 on fillfactor04(d_datacadastro);
create index  d_datacadastro_fillfactor05 on fillfactor05(d_datacadastro);
create index  d_datacadastro_fillfactor06 on fillfactor06(d_datacadastro);
create index  d_datacadastro_fillfactor07 on fillfactor07(d_datacadastro);
create index  d_datacadastro_fillfactor08 on fillfactor08(d_datacadastro);
create index  d_datacadastro_fillfactor09 on fillfactor09(d_datacadastro);
create index  d_datacadastro_fillfactor10 on fillfactor10(d_datacadastro);
create index  d_datacadastro_fillfactor11 on fillfactor11(d_datacadastro);
create index  d_datacadastro_fillfactor12 on fillfactor12(d_datacadastro);

create index  nome_fillfactor01 on fillfactor01 using gin (nome gin_trgm_ops );
create index  nome_fillfactor02 on fillfactor02 using gin (nome gin_trgm_ops );
create index  nome_fillfactor03 on fillfactor03 using gin (nome gin_trgm_ops );
create index  nome_fillfactor04 on fillfactor04 using gin (nome gin_trgm_ops );
create index  nome_fillfactor05 on fillfactor05 using gin (nome gin_trgm_ops );
create index  nome_fillfactor06 on fillfactor06 using gin (nome gin_trgm_ops );
create index  nome_fillfactor07 on fillfactor07 using gin (nome gin_trgm_ops );
create index  nome_fillfactor08 on fillfactor08 using gin (nome gin_trgm_ops );
create index  nome_fillfactor09 on fillfactor09 using gin (nome gin_trgm_ops );
create index  nome_fillfactor10 on fillfactor10 using gin (nome gin_trgm_ops );
create index  nome_fillfactor11 on fillfactor11 using gin (nome gin_trgm_ops );
create index  nome_fillfactor12 on fillfactor12 using gin (nome gin_trgm_ops );

insert into fillfactor (descricao , nome , d_datacadastro , t_horacadastro )
select 'desc'||b , 'nome '||a , ('01-'||LPAD(a::text, 2 ,'0')||'-2023')::date , current_time  
from generate_series( 1 , 12 , 1 ) a 
cross join generate_series( 1 , 1000000, 1) b;

do
$$
begin
for i in reverse 1000000 .. 0 by 1
loop 
update fillfactor set nome = 'update1 '||date_part('month' , a.d_datacadastro ) , d_datacadastro=a.d_datacadastro+interval '1 month' 
from fillfactor a
where  fillfactor.id = (select max(id) from fillfactor where nome ~* 'nome' );
end loop;
end;
$$language plpgsql ; 