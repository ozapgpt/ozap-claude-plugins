---
name: configurar-cliente
description: Monta do zero o atendente de WhatsApp com IA de um negócio no oZapOnline (agente, prompt, base de conhecimento, funil, teste e ligação ao número). Use quando o usuário pedir para configurar, montar ou criar o atendente, o robô ou o agente de uma empresa.
---

# Configurar o atendente de um negócio

O passo a passo completo vive no servidor do oZapOnline e muda com ele. O manual (`get_playbook`) é a regra; esta skill só o resume. Antes de qualquer outra coisa:

1. Chame `get_playbook` com `topic: "configurar-cliente"` e siga o manual.
2. Confira "scoped to instance N" nas instruções do servidor e confirme com o usuário que é o cliente certo. Uma sessão de trabalho = um cliente.
3. Chame `get_setup_status` para ver o que já existe e o que falta (`next_steps` e `human_required`). Chame de novo depois de cada mudança.

Regras que valem sempre:

- Monte a ficha do negócio (o que vende, preços, horários, endereço, formas de pagamento, tom de voz) com o usuário antes de escrever qualquer coisa. Nunca invente fato do negócio: se faltar, pergunte.
- Antes de cada escrita (`create_agent`, `edit_agent_prompt`, `add_knowledge`, `apply_pipeline_preset`, `link_agent_to_connection`), mostre o que vai mudar e espere o usuário aprovar.
- **Escrita em duas etapas.** `link_agent_to_connection`, `restore_prompt_version`, `delete_knowledge`, `set_followup_settings`, `set_number_rules` e outras respondem a primeira chamada com uma prévia e um `confirm_token`, sem mudar nada. Mostre a prévia inteira ao usuário; só depois do "sim" dele chame de novo com os MESMOS argumentos mais o token. O token vale uma vez e expira em 10 minutos: nunca guarde um token nem peça prévia nova só para contornar uma recusa (se a recusa disser que algo mudou, mostre a prévia nova).
- **Prompt.** Leia o atual (`get_agent`), guarde uma cópia num arquivo local (`backup-<cliente>-<data-hora>.md`) e mostre a diferença. Aplique com `edit_agent_prompt` passando o `prompt_sha256` lido como `expected_sha256`; use `dry_run: true` para ver a diferença antes de gravar. Se vier `conflict_prompt_changed`, nada foi gravado: releia e peça a aprovação de novo. Se `sharedAcross` for maior que 1 (o mesmo agente atende outros números), pare e confirme com o usuário. Com a credencial só de `manage_agent` (sem `edit_agent_prompt`), o caminho é `get_agent_config` e `update_agent_prompt`, com a mesma trava, o mesmo backup e o `dry_run`.
- **`test_agent` gasta a IA do cliente.** Teste antes de ligar ao número, com 5 a 8 perguntas reais do negócio, até 6 por chamada, sem repetir o mesmo teste. Pare e avise o usuário se vier `rate_limited` ou `plan_required`. O teste não manda mensagem a ninguém.
- **Perfil de montagem nunca envia mensagem a cliente final.** `send_message` e similares só para o número do próprio usuário, e só se ele pedir naquela conversa.
- **Ligar a IA do número é do humano.** A credencial de montagem não tem `toggle_ai`: quem liga e desliga a IA é o usuário, no painel. Só quem tem a permissão `manage_agent` enxerga `toggle_ai`, e só se usa com ordem explícita do dono. Para a checagem de ir ao ar, use a skill `testar-e-ir-ao-ar`.
- Nunca peça chave de provedor de IA, chave de API ou senha. Se o usuário colar uma, diga para revogá-la no painel.
- Se uma tool não aparecer, a credencial não tem a permissão (ou a conta não foi liberada para as tools de configuração): peça ao usuário para ajustar as permissões no painel ou refazer o login com `/mcp`. Não tente contornar.
- Follow-up, agenda, regras de número e campos de lead ficam na skill `automacao-e-agenda`.
