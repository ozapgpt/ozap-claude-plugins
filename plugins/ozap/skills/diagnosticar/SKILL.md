---
name: diagnosticar
description: Investiga, só lendo, por que o atendente de WhatsApp do oZapOnline não responde, responde errado ou a conexão caiu. Use quando o usuário relatar que a IA parou, que o número desconectou ou que uma tool deu erro.
---

# Diagnosticar

1. Chame `get_playbook` com `topic: "diagnostico"` e siga a ordem dele.
2. Comece por `get_setup_status`: `reasons_not_answering` diz por que o número não responde. Veja também `get_connection_status` e, para o que as credenciais externas fizeram, `get_activity_log`.
3. Quando o atendente não responde, confira nesta ordem:
   1. Filtro "Somente Responder": com qualquer número na lista, a IA só responde a eles.
   2. A IA do número está ligada?
   3. A conversa está pausada (`pause_chat`)? Pausa vencida conta como não pausada.
   4. O número está conectado ao WhatsApp (`get_connection_status`)?
   5. O agente está ligado ao número (`get_agent` ou `get_agent_config`)? Agente criado com `create_agent` não responde até ser ligado com `link_agent_to_connection`.
4. Quando responde errado, compare a resposta com o prompt: falta regra, a regra é ambígua ou o fato não está no prompt nem na base? Corrija só o trecho responsável.
5. Erros das tools têm código estável (`conflict_prompt_changed`, `rate_limited`, `plan_required`, `forbidden_scope`...): decida pelo código, conforme a tabela do manual.

Este fluxo só lê. Explique a causa provável com a evidência que você viu e o que o usuário deve fazer. Se a correção exigir escrever algo, mostre o que vai mudar e espere a aprovação; ligar a IA do número só com ordem do dono. Nunca tente contornar uma permissão que falta.
