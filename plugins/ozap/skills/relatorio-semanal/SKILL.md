---
name: relatorio-semanal
description: Monta um resumo do atendimento no WhatsApp pelo oZapOnline (conversas, contatos novos, etapas do funil) de um período. Use quando o usuário pedir relatório, resumo da semana ou números do atendimento.
---

# Relatório do período

1. Pergunte o período se o usuário não disse (padrão: últimos 7 dias).
2. Use `get_report` e `get_account_overview`; para o funil, `list_pipeline_stages`.
3. Entregue em tabela curta, com os números e o que mudou em relação ao período anterior quando houver dado.

Este fluxo só lê. Não envie o relatório a ninguém pelo WhatsApp sem ordem explícita.
