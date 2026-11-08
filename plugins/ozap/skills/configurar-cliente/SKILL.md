---
name: configurar-cliente
description: Monta do zero o atendente de WhatsApp com IA de um negócio no oZapOnline (agente, prompt, base de conhecimento, funil, teste e ligação ao número). Use quando o usuário pedir para configurar, montar ou criar o atendente, o robô ou o agente de uma empresa.
---

# Configurar o atendente de um negócio

O passo a passo completo vive no servidor do oZapOnline e muda com ele. Antes de qualquer outra coisa:

1. Chame `get_playbook` com `topic: "configurar-cliente"` e siga o manual.
2. Chame `get_setup_status` para ver o que já existe e o que falta.

Regras que valem sempre:

- Monte a ficha do negócio (o que vende, preços, horários, endereço, formas de pagamento, tom de voz) com o usuário antes de escrever qualquer coisa. Nunca invente fato do negócio: se faltar, pergunte.
- Antes de cada escrita (`create_agent`, `edit_agent_prompt`, `add_knowledge`, `apply_pipeline_preset`, `link_agent_to_connection`), mostre o que vai mudar e espere o usuário aprovar.
- Teste com `test_agent` antes de ligar ao número. O teste não manda mensagem a ninguém.
- Não ligue a IA no número (`toggle_ai`) sem ordem explícita do usuário. Para isso, use a skill `testar-e-ir-ao-ar`.
- Nunca peça chave de provedor de IA, chave de API ou senha. Se o usuário colar uma, diga para revogá-la no painel.
- Se uma tool não aparecer, a credencial não tem a permissão: peça ao usuário para refazer o login com `/mcp` e marcar a permissão na tela de consentimento.
