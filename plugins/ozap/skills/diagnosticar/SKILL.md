---
name: diagnosticar
description: Investiga, só lendo, por que o atendente de WhatsApp do oZapOnline não responde, responde errado ou a conexão caiu. Use quando o usuário relatar que a IA parou, que o número desconectou ou que uma tool deu erro.
---

# Diagnosticar

1. Chame `get_playbook` com `topic: "diagnostico"`.
2. Veja a conexão com `get_connection_status` e o que aconteceu com `get_activity_log`.
3. Confira se a IA está ligada e se o agente está ligado ao número (`get_setup_status`).

Este fluxo só lê. Explique a causa provável com a evidência que você viu e o que o usuário deve fazer. Se a correção exigir escrever algo, mostre o que vai mudar e espere a aprovação.
