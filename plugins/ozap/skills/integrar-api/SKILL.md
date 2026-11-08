---
name: integrar-api
description: Orienta a integração de um sistema próprio com o oZapOnline pela API REST v1 e webhooks assinados. Use quando o usuário quiser enviar mensagens a partir do próprio sistema, receber eventos do WhatsApp num servidor ou gerar código de integração.
---

# Integrar pela API REST

- Base: `https://api.ozaponline.com/api/v1`. Autenticação pelo header `x-api-key` com uma chave criada no painel (IA e API > Nova chave), com só as permissões necessárias.
- A chave fica no servidor do usuário, em variável de ambiente. Nunca no código, no front-end ou no chat.
- Envios têm limite por número: 60 por hora e 300 por dia pela API e pelo MCP juntos, além do limite por minuto da chave. Acima disso a resposta é `429 send_limit_reached` com `Retry-After`. Não use a API para envio em massa ou para quem não pediu para receber.
- Use `idempotency_key` em todo envio para não duplicar mensagem em nova tentativa.
- Webhooks chegam assinados com HMAC: valide a assinatura com o segredo do webhook antes de confiar no conteúdo.

A especificação OpenAPI de todos os endpoints é pública em `https://api.ozaponline.com/api/v1/openapi.json`: leia antes de gerar código.
