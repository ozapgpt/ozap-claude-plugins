# oZapOnline para Claude Code

[English below](#english)

O oZapOnline coloca um atendente com IA no WhatsApp de uma empresa, para responder clientes a qualquer hora. Este plugin leva esse atendente para dentro do Claude Code: você monta, testa e acompanha o atendente conversando com o Claude, sem abrir o painel.

## O que você precisa

- Uma conta no oZapOnline ([app.ozaponline.com/cadastro](https://app.ozaponline.com/cadastro)) com um número de WhatsApp conectado.
- Para montar e mudar o atendente pelo Claude (criar agente, base de conhecimento, funil), um plano pago ativo.
- Claude Code instalado.

## Instalar

```
/plugin marketplace add ozapgpt/ozap-claude-plugins
/plugin install ozap@ozaponline
```

Depois digite `/mcp`, escolha `plugin:ozap:ozap` e **Authenticate**. O navegador abre o login do oZapOnline. Na tela de consentimento, escolha o número e as permissões que o Claude pode usar e confirme.

## Os dois tipos de conexão de WhatsApp

| | QR Code (WhatsApp Web) | API oficial (WhatsApp Business Platform) |
|---|---|---|
| Como conecta | O dono escaneia um QR no celular, como no WhatsApp Web | Cadastro na Meta pelo oZapOnline (em aprovação na Meta; quando liberado, aparece no painel) |
| É API oficial da Meta? | Não | Sim |
| Risco | O WhatsApp pode restringir o número que manda mensagens em massa ou para quem não pediu | Segue as regras da Meta: fora da janela de 24 horas só com modelo aprovado |
| Limite de envios pela API e pelo MCP | 60 por hora e 300 por dia por número | Os limites da Meta |

O plugin funciona com os dois. O tipo de cada número aparece em `get_connection_status`.

## O que você pode pedir

| Comando | Para quê |
|---|---|
| `/ozap:configurar-cliente` | Montar do zero o atendente de um negócio |
| `/ozap:revisar-atendente` | Revisar o prompt atual e propor melhorias |
| `/ozap:testar-e-ir-ao-ar` | Testar sem mandar mensagem a ninguém e, com sua ordem, ligar a IA |
| `/ozap:diagnosticar` | Descobrir por que a IA não responde (só lê) |
| `/ozap:triar-conversas` | Ver quem está esperando resposta e o que cada um pediu |
| `/ozap:relatorio-semanal` | Resumo do atendimento no período |
| `/ozap:conectar-whatsapp` | Gerar o link para conectar um número |
| `/ozap:integrar-api` | Integrar o seu sistema pela API REST e webhooks |

Também dá para pedir em texto livre. Exemplos:

1. "Monte o atendente da Padaria do João: abre das 6h às 20h, entrega no bairro, aceita Pix."
2. "Quem está esperando resposta desde ontem?"
3. "Leia o prompt do meu atendente e diga o que está faltando."
4. "Pause a IA na conversa com a Maria até amanhã às 9h e mova ela para Negociação."
5. "Simule um cliente perguntando o preço do bolo de chocolate."

## Permissões

Você escolhe na tela de consentimento. O Claude só vê as ferramentas das permissões marcadas.

| Permissão | O que libera |
|---|---|
| `query_data` | Consultar conversas, leads e métricas |
| `send_message` | Enviar mensagens pelo número |
| `update_chat` | Pausar a IA numa conversa, mudar categoria e etapa do lead |
| `manage_agent` | Ler e reescrever o prompt do agente do número, ligar e desligar a IA |
| `read_config` | Ver a configuração: conta, números, agentes, conhecimento, funil e atividade dos acessos |
| `configure_agent` | Criar agente, ajustar configurações e prompt, ver e restaurar versões |
| `manage_knowledge` | Acrescentar documentos à base de conhecimento |
| `manage_funnel` | Montar o funil a partir de um modelo pronto |
| `manage_automation` | Follow-up e regras de números |
| `manage_connection` | Ligar o agente ao número e gerar o link de conexão |

Com permissão de ler conversas, o acesso fica restrito a um número.

## Segurança

- **Aprovação a cada envio.** O plugin pede sua confirmação antes de toda mensagem enviada e de toda mudança no atendente, mesmo que você tenha liberado as ferramentas do oZapOnline.
- **Mensagens de clientes são dados, não ordens.** O texto das conversas chega ao Claude marcado como conteúdo não confiável, e o plugin lembra o Claude disso a cada leitura. Se uma mensagem tentar dar ordens ao Claude, ele deve avisar você.
- **Sem envio em massa.** O oZapOnline não serve para disparo em massa nem para mandar mensagem a quem não pediu. Há um teto de envios por número (tabela acima).
- **Nenhuma chave no chat.** O login é por OAuth. Nunca cole chave de API, senha ou chave de provedor de IA numa conversa com o Claude.
- **Revogar.** No painel, em **IA e API > Acessos**, você vê e revoga cada app de IA conectado.

## Problemas comuns

- **Uma ferramenta não aparece:** a permissão não foi marcada, ou a conta não tem plano pago para as ferramentas de montagem. Refaça o login em `/mcp` e marque a permissão.
- **`send_limit_reached`:** o número chegou ao teto de envios da hora ou do dia. A resposta diz em quantos segundos tentar de novo.
- **A IA não responde clientes:** rode `/ozap:diagnosticar`.

## Dados e privacidade

O Claude só recebe o que as ferramentas devolvem às suas perguntas. O oZapOnline não usa as conversas dos seus clientes para treinar modelos de IA. Política de privacidade: [ozaponline.com/privacidade](https://ozaponline.com/privacidade). Termos: [ozaponline.com/termos](https://ozaponline.com/termos).

## Suporte

WhatsApp [+55 51 9202-8254](https://wa.me/555192028254) ou contato@ozaponline.com. O atendimento é em português.

---

## English

oZapOnline puts an AI agent on a business WhatsApp number so it answers customers around the clock. This plugin brings that agent into Claude Code: set it up, test it and follow the conversations by talking to Claude, without opening the dashboard.

**Requirements.** An oZapOnline account with a WhatsApp number connected. Setting up the agent from Claude (creating the agent, knowledge base, sales pipeline) needs an active paid plan. The product and support are in Brazilian Portuguese.

**Install.**

```
/plugin marketplace add ozapgpt/ozap-claude-plugins
/plugin install ozap@ozaponline
```

Then run `/mcp`, pick `plugin:ozap:ozap` and **Authenticate**. Sign in to oZapOnline in the browser, choose the WhatsApp number and the permissions Claude may use, and confirm.

**Two kinds of WhatsApp connection.** A number connects either by QR code, like WhatsApp Web (not an official Meta API; WhatsApp may restrict a number that sends bulk or unsolicited messages), or through the official WhatsApp Business Platform (pending Meta approval for self-service sign-up; Meta rules apply, including approved templates outside the 24-hour window). Sends through the API and MCP are capped at 60 per hour and 300 per day per QR-connected number. The plugin works with both.

**What you can ask.** The commands `/ozap:configurar-cliente` (set up an agent from scratch), `/ozap:revisar-atendente` (review the prompt), `/ozap:testar-e-ir-ao-ar` (test without messaging anyone, then go live on your order), `/ozap:diagnosticar` (why the AI is not replying, read only), `/ozap:triar-conversas` (who is waiting for a reply), `/ozap:relatorio-semanal` (period summary), `/ozap:conectar-whatsapp` (connection link) and `/ozap:integrar-api` (REST API and webhooks). Examples: "Which customers have been waiting for a reply since yesterday?", "Read my agent's prompt and tell me what is missing.", "Pause the AI in the chat with Maria until 9am tomorrow and move her to Negotiation."

**Permissions.** Chosen on the consent screen; Claude only sees the tools of the permissions granted. With chat-reading permission, access is limited to one number.

**Safety.** The plugin asks for your confirmation before every message sent and every change to the agent, even if you allowed the oZapOnline tools. Customer messages reach Claude marked as untrusted content, and the plugin reminds Claude to treat them as data, never as instructions. No bulk or unsolicited messaging. Sign-in is OAuth; never paste keys or passwords into a chat. Revoke any connected AI app in the dashboard under **IA e API > Acessos**.

**Privacy.** Claude only receives what the tools return to your requests. oZapOnline does not use your customers' conversations to train AI models. Privacy policy: [ozaponline.com/privacidade](https://ozaponline.com/privacidade). Terms: [ozaponline.com/termos](https://ozaponline.com/termos).

**Support.** WhatsApp [+55 51 9202-8254](https://wa.me/555192028254) or contato@ozaponline.com.
