---
name: revisar-atendente
description: Lê o prompt e as configurações atuais do atendente de WhatsApp no oZapOnline e propõe melhorias, sem aplicar nada sozinho. Use quando o usuário pedir para revisar, melhorar ou entender o que o atendente está fazendo.
---

# Revisar o atendente

1. Chame `get_playbook` com `topic: "escrever-prompt"`.
2. Leia a configuração com `get_agent` (credencial de montagem) ou `get_agent_config` (credencial `manage_agent`) e o histórico com `list_prompt_versions`.
3. Aponte o que está faltando ou contraditório e proponha o texto novo, mostrando a diferença.

Só aplique com ordem explícita do usuário, depois de guardar uma cópia do prompt atual num arquivo local (`backup-<cliente>-<data-hora>.md`):

- Credencial de montagem: `edit_agent_prompt` com o `expected_sha256` da versão que você leu; use `dry_run: true` para ver a diferença antes.
- Credencial só com `manage_agent`: `update_agent_prompt` com o texto completo, o mesmo `expected_sha256` e `dry_run`.

Se a versão mudou no meio do caminho (`conflict_prompt_changed`), nada foi gravado: leia de novo e mostre a diferença outra vez. Se `sharedAcross` for maior que 1, o mesmo agente atende outros números: confirme com o usuário. Para desfazer, existe `restore_prompt_version`, em duas etapas: mostre a prévia inteira e só reenvie, com os MESMOS argumentos mais o `confirm_token`, depois do "sim" do usuário. Nunca guarde um token. Depois de gravar, releia o prompt e confira o que foi gravado.
