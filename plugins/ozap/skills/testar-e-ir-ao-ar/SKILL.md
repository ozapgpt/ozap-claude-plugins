---
name: testar-e-ir-ao-ar
description: Testa o atendente de WhatsApp do oZapOnline sem mandar mensagem a clientes e, com ordem do usuário, coloca a IA no ar no número. Use quando o usuário quiser testar o atendente, simular uma conversa ou ligar a IA.
---

# Testar e ir ao ar

1. Chame `get_playbook` com `topic: "go-live"` e siga a checagem.
2. Simule conversas com `test_agent`: ele responde como o atendente, sem enviar nada a ninguém. Teste perguntas reais do negócio, preço, horário, e algo que o atendente não deve responder.
3. Chame `get_setup_status` e mostre ao usuário o que ainda falta.

Ligar a IA no número (`toggle_ai` com `enabled: true`) faz o atendente responder clientes reais imediatamente. Só faça com ordem explícita do usuário, depois de mostrar o resultado dos testes.
