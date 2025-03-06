# 🚨 Anti-Limbo - Sistema de Prevenção de Limbo

**Anti-Limbo** é um sistema desenvolvido para **FiveM**, projetado para impedir que jogadores caiam no "limbo" do jogo. 
Quando um jogador está em uma zona inacessível (coordenadas `z` muito baixas), ele é automaticamente teleportado para a garagem mais próxima, garantindo que ele não fique preso.

## 🎥 Preview
- [Youtube](https://www.youtube.com/watch?v=1EUSlMypZNs)

## 📌 Funcionalidades

- **Detecção automática de "limbo"**: Monitora a posição do jogador para detectar se ele caiu em uma área fora do mapa (coordenadas `z` menores que -50, facilmente alterável).
- **Teletransporte automático**: Quando o jogador é detectado no "limbo", ele é teletransportado para a garagem mais próxima automaticamente.
- **Remoção do veículo**: O sistema remove o veículo do jogador para evitar que ele fique preso com o veículo em uma área inacessível.
- **Log no Discord**: O evento de teletransporte é registrado automaticamente em um webhook do Discord com informações sobre o jogador e a garagem para onde ele foi levado.
- **Notificação**: O jogador recebe uma notificação avisando que foi salvo e teletransportado para a garagem.

---

## 🛠️ Como Instalar

### Passo 1: Baixar o Repositório

Clone ou baixe os arquivos do repositório para o seu servidor **FiveM**:

```bash
git clone https://github.com/seu-usuario/anti-limbo.git
```
### Passo 2: Coloque o script na Pasta de Recursos

### Passo 3: Adicione no server.cfg

Abra o arquivo server.cfg e adicione a linha abaixo para iniciar o recurso:

```bash
start anti-limbo
```

### ⚙️ Configuração
Configuração do Webhook do Discord para onde os logs serão enviados. 

- No arquivo server.lua, altere a URL do webhook:
```bash
Config.DiscordWebhook = "https://discord.com/api/webhooks/SEU_WEBHOOK_AQUI"
```
- Adicione as Garagens
No mesmo arquivo server.lua, adicione as coordenadas e os nomes das garagens para onde os jogadores serão teleportados ao caírem no "limbo":

```bash
Config.Garages = {
    { name = "Los Santos", coords = vector3(215.124, -791.377, 30.946) },
    { name = "Centro", coords = vector3(-340.965, -874.885, 31.083) },
    { name = "Sandy Shores", coords = vector3(1174.76, 2635.92, 37.75) },
    { name = "Paleto Bay", coords = vector3(-773.34, 5594.43, 33.60) }
}
```
---

## 🔑 Licença e Uso

Este projeto é **livre para uso público**, **mas a venda do código ou de modificações não é permitida**. Você pode usar, modificar e redistribuir o código, desde que não o comercialize ou o utilize para fins lucrativos.

Qualquer redistribuição ou modificação deve manter a autoria original e o crédito para o projeto. Isso garante que o trabalho e a contribuição da comunidade sejam sempre reconhecidos.

---

## 📩 Contato

Caso tenha **dúvidas** ou **sugestões**, sinta-se à vontade para entrar em contato comigo diretamente no **Discord**: seinada10#4840.

---

## 🌟 Agradecimentos

Agradecemos imensamente a todos os **colaboradores** e à **comunidade do FiveM** por seu apoio contínuo!  

É um grande **orgulho** fazer parte dessa incrível comunidade desde 2018. Vamos continuar criando e evoluindo juntos! 🙌

