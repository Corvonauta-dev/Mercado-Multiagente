# Mercado Multiagente

Este repositório foi criado para armazenar um dos meus últimos trabalhos de graduação na Universidade Tecnológica Federal do Paraná: um simulador de mercado com sistema multiagente, totalmente personalizado e desenvolvido em Godot.

## Agradecimento especial

Gostaria de agradecer especialmente ao **Leonardo de Campos**, que foi meu parceiro neste trabalho!

## Detalhes do projeto

- **Plataforma:** Godot (versão Godot_v4.0.3-stable)

## O Problema

O trabalho consiste em simular um mercado onde existem vários vendedores e compradores que interagem entre si sem interferência humana.

## Funcionamento do Sistema

1. Ao iniciar, os vendedores são gerados.
2. Após selecionar o número desejado de compradores, eles também são gerados.
3. Cada comprador visita todos os vendedores.
4. Após visitar o último vendedor, o comprador retorna e vai até outro comprador que possui interesse no mesmo item.
5. Inicia-se uma negociação entre o comprador e o vendedor.
6. Se a negociação for bem-sucedida, o comprador adquire o item que já não está mais disponível na loja do vendedor.
7. Caso contrário, o comprador vai embora.

## Visualizações

### Vendedores

![190ddc5a-326e-4f4d-8bde-35354eb6cdf2](https://github.com/Corvonauta-dev/Mercado-Multiagente/assets/78376569/8c38a126-3774-46ca-af78-9803dd0364b6)
![Captura de tela 2024-06-20 001331](https://github.com/Corvonauta-dev/Mercado-Multiagente/assets/78376569/120e97c4-a95e-4637-953b-25c120a9d10d)

### Compradores

![f2efde5a-43c1-4333-b2b4-a1515f0553ed](https://github.com/Corvonauta-dev/Mercado-Multiagente/assets/78376569/cbce2c22-df6e-45ac-97a1-f9b46edf1944)
![compradores](https://github.com/Corvonauta-dev/Mercado-Multiagente/assets/78376569/8e63ab46-90b6-4877-9935-e68d8af4e1cb)
![compradores 2](https://github.com/Corvonauta-dev/Mercado-Multiagente/assets/78376569/2c4ab61d-7461-4fae-a567-197d6bd1ab46)

### Simulador em Execução

![WhatsApp Video 2023-05-25 at 21 58 16](https://github.com/Corvonauta-dev/Mercado-Multiagente/assets/78376569/3cfe775f-44a6-4eb7-be5a-c7927e053fde)
![simulação](https://github.com/Corvonauta-dev/Mercado-Multiagente/assets/78376569/21996a2e-686d-4033-8b6c-b8857c798feb)
