with 
    fonte_produtos as (
        select *
        from {{ source('sap', 'products') }}
    )
    , renomear as (
        select  
                cast(ID as int) as pk_produto
                ,cast(PRODUCTNAME as string) as nm_produto
                ,cast(SUPPLIERID as int) as fk_fornecedor
                ,cast(CATEGORYID as int) as fk_categoria
                ,cast(QUANTITYPERUNIT as string) as quatidade_por_unidade
                ,cast(UNITPRICE as numeric(10,2)) as preco_por_unidade
                ,cast(UNITSINSTOCK as int) as unidade_estoque
                ,cast(UNITSONORDER as int) as unidade_por_pedido
                ,cast(REORDERLEVEL as int) as nivel_de_pedido
                ,case 
                    when DISCONTINUED = 0 then true
                    when DISCONTINUED = 0 then false 
                end as discontinuado
        from fonte_produtos
    )

    
select *
from renomear