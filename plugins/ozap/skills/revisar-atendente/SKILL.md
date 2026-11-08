---
name: revisar-atendente
description: Lê o prompt e as configurações atuais do atendente de WhatsApp no oZapOnline e propõe melhorias, sem aplicar nada sozinho. Use quando o usuário pedir para revisar, melhorar ou entender o que o atendente está fazendo.
---

# Revisar o atendente

1. Chame `get_playbook` com `topic: "escrever-prompt"`.
2. Leia a configuração com `get_agent` (ou `get_agent_config`) e o histórico com `list_prompt_versions`.
3. Aponte o que está faltando ou contraditório e proponha o texto novo, mostrando a diferença.

Só aplique com ordem explícita do usuário, usando `edit_agent_prompt` com o `expected_sha256` da versão que você leu. Se a versão mudou no meio do caminho, leia de novo e mostre a diferença outra vez. Para desfazer, existe `restore_prompt_version`.
