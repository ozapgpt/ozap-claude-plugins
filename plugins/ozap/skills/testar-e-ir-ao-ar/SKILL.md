---
name: testar-e-ir-ao-ar
description: Testa o atendente de WhatsApp do oZapOnline sem mandar mensagem a clientes, faz a checagem antes de ir ao ar e orienta a colocar a IA no número. Use quando o usuário quiser testar o atendente, simular uma conversa ou ligar a IA.
---

# Testar e ir ao ar

O manual `go-live` é a regra; esta skill o segue.

1. Chame `get_playbook` com `topic: "go-live"`.
2. Simule conversas com `test_agent`: ele responde como o atendente, sem enviar nada a ninguém, mas **gasta a IA do cliente**. Use de 5 a 8 perguntas reais do negócio, até 6 por chamada, sem repetir o mesmo teste. Cubra: preço; algo fora do que está no prompt; pedido para falar com humano; cliente irritado; "você é um robô?"; mensagem fora do horário. Pare e avise o usuário se vier `rate_limited` ou `plan_required`. Nunca use `send_message` para testar com número de cliente final.
3. Chame `get_setup_status` e leia `ready_to_answer`, `reasons_not_answering` e `human_required`.
4. Confirme com o usuário, item por item (checagem de 7 itens do manual):
   1. Testes aprovados.
   2. Base de conhecimento pronta (todos os documentos `ready` em `list_knowledge`).
   3. Follow-up como o cliente quer (começa desligado; `get_followup_settings` mostra, `set_followup_settings` liga com prévia e aprovação).
   4. Funil escolhido.
   5. Agente ligado ao número (`link_agent_to_connection`, com prévia) e WhatsApp conectado (`get_connection_status`).
   6. Quem atende quando a IA passar para humano, e em que horário.
   7. Filtro "Somente Responder": tirar ou manter para só alguns números. `clear_allowed_numbers` tira e `set_number_rules` troca a lista, ambos com prévia (diz quantas conversas voltam a ser respondidas) e aprovação.

Escrita em duas etapas: nas tools que devolvem prévia com `confirm_token`, mostre a prévia inteira e só reenvie, com os MESMOS argumentos mais o token, depois do "sim" do usuário. Nunca guarde um token.

## Ir ao ar é decisão do humano

Ligar a IA faz o atendente responder todo mundo e devolve ao robô conversas que um humano tinha assumido; avise isso antes.

- Credencial de montagem: ela não tem `toggle_ai`. O usuário tira o filtro de teste e liga a IA no painel. Explique o passo e espere.
- Credencial com `manage_agent`: `toggle_ai` com `enabled: true` só com ordem explícita do dono, depois de mostrar o resultado dos testes. O mesmo vale para desligar (`enabled: false`).

Peça ao usuário para acompanhar as primeiras conversas reais no painel no mesmo dia.
