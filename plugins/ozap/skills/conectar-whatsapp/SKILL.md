---
name: conectar-whatsapp
description: Ajuda a conectar um número de WhatsApp ao oZapOnline, gerando o link de conexão e acompanhando o status. Use quando o usuário quiser conectar, reconectar ou trocar o número.
---

# Conectar um número

O oZapOnline tem dois tipos de conexão:

- **QR Code (WhatsApp Web):** o dono do número escaneia um QR no celular, como no WhatsApp Web. Não é uma API oficial da Meta; o número pode ser restringido pelo WhatsApp se mandar mensagens em massa ou para quem não pediu.
- **API oficial (WhatsApp Business Platform):** pelo cadastro da Meta, em aprovação; enquanto não for liberado no painel, a conexão nova é por QR Code. Mensagens fora da janela de 24 horas exigem modelo aprovado.

Passos:

1. Gere o link com `create_connection_link` e entregue ao usuário. O link é um segredo: entregue só ao dono do número. Escanear o QR (ou digitar o código de pareamento) é passo humano, feito no celular dele.
2. Acompanhe com `get_connection_status` até aparecer conectado.

Nunca peça código de verificação, senha ou token no chat.
