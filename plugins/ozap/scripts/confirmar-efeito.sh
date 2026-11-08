#!/bin/sh
# Pede aprovação a cada envio ou mudança no atendente, mesmo que o usuário
# tenha liberado as tools do oZap: é o que um cliente final vai sentir.
cat >/dev/null
printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"oZapOnline: isto envia uma mensagem pelo WhatsApp ou muda o atendente que os seus clientes veem. Confira o destino e o texto antes de aprovar."}}'
