    <pre> 
    Documentação da API
    
    Todas as chamadas iniciadas com "http://mimamura.com/api"
    
    O parâmetro "key" identifica a instância do SoS (string de 12 digitos no canto inferior esquerdo da interface)

    Comandos:
    
    /getNodes/key    
        Retorna os atributos dos nós no modelo

    /getEdges/key
        Retorna os atributos das arestas no modelo

    /getSoS/key    
        Retorna um script para desenhar o modelo corrente

    /setBackground/id/color/key
        Muda cor do fundo do nó [id] para [color]
        Cor em notação hex ou por extenso como em https://www.w3schools.com/tags/ref_colornames.asp

    /setLabel/id/texto/key
        Muda label do nó [id] para [texto]

    /setPriority/id/priority
        Muda prioridade da aresta [id] para [priority]

    /setIpAddress/id/addr/key
        Muda o endereço IP do nó [id] para [addr]

    /setResponseTime/id/numero/key
        Muda response time do nó [id] para [numero]

    /setAvailability/id/numero/key
        Muda availability do nó [id] para [numero]

    /setTooltip/id/texto/key
        Muda tooltip (mouse over) do nó [id] para [texto]

    /sendMessage/texto/tipo/key   
        Manda mensagem [msg] para o modelo do tipo especificado
        Tupo=[sucess|warning|error]

</pre>
