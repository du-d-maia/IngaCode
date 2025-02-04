# IngaCodeTeste
 Teste técnico IngaCode

Software desenvolvido em Delphi para aplicação de Teste Técnico solicitado pela IngaCode.

Para verificar o código fonte, basta executar o ProjetoIngaCode através da IDE RAD Studio Delphi 12.

Para Executar sem o RAD Studio Delphi 12, basta executar o arquivo Win64/Debug/ProjetoIngaCode.exe

Os principais códigos fontes que tratam da realização das tarefas podem ser visualizados nos seguintes arquivos:

IngaCode.pas - Tela principal do sistema, contêm um botão para cada atividade a ser realizada.

Atv1.pas - Conversor de Algarismos Romanos, possui um campo para inserir o valor, um botão para Converter o valor informado, uma caixa de seleção para acionar o Cálculo Dinâmico, um Switch para mudar a conversão de Decimal para Romano e vice-versa, o Resultado da conversão estará abaixo do campo preenchido, na parte inferior da janela estará um breve resumo das regras que definem o funcionamento dos números romanos.

Atv2.pas - Gerador de Senha, possui um campo para definir a quantidade de caracteres na senha, 4 caixas de seleção para definir complexidade da senha, um botão para gerar a Senha que será exibida logo ao lado, e um botão para copiar a Senha para a Área de Transferência.

Atv3.pas - Simulador de Elevador - Possui 2 painéis, um à esquerda com elementos pra reprensentar o Prédio, os Andares, o Poço e o Elevador, com Botões em cada Andar para chamar o Elevador. É necessário pressionar um dos botões de qualquer andar para habilitar o segundo painel, que representa o Painel Interno do Elevador, com botões que podem ser pressionados em sequência para acessar vários andares. No Painel Interno, também há um campo para visualização do andar atual. O Elevador retornará automaticamente ao andar 0 se nenhum comando for acionado em 15 segundos. Ao chegar em algum andar selecionado, será emitido um som de aviso.
