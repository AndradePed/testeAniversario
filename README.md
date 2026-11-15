# Piréu 18 — GitHub Pages + Supabase

## 1. Criar e configurar Supabase
1. Crie um projeto em https://supabase.com/dashboard.
2. Em Authentication → Users → Add user, crie seu usuário administrador com seu e-mail e senha. Copie o UUID desse usuário.
3. Abra `supabase/schema.sql`, substitua `ADMIN_USER_UUID` pelo UUID copiado e execute o SQL no SQL Editor.
4. Em Project Settings → API, copie Project URL e publishable key (ou anon key legada) para `assets/config.js`.
5. Nunca coloque `service_role` ou secret key no JavaScript público.
6. Em Authentication → Providers, mantenha Email habilitado e desative o cadastro público (Allow new users to sign up).

## 2. Testar
Sirva a pasta por um servidor local (módulos JS não funcionam abrindo direto por `file://`):
```bash
python -m http.server 8000
```
Acesse http://localhost:8000.

## 3. Publicar no GitHub Pages
1. Crie um repositório, por exemplo `pireu-18`.
2. Envie o conteúdo desta pasta para a raiz da branch `main`.
3. No repositório, Settings → Pages → Build and deployment → Deploy from a branch.
4. Selecione `main` e `/ (root)`, salve e aguarde o endereço publicado.

## 4. Painel administrativo
Acesse `https://SEU-USUARIO.github.io/SEU-REPOSITORIO/admin.html` e entre com o usuário criado no Supabase. A URL do painel não é segredo: a segurança está no login e na política RLS que permite excluir somente ao UUID cadastrado.

## Permissões
- Visitantes sem login: podem ler e enviar mensagens.
- Visitantes sem login: não podem editar nem excluir.
- Usuário autenticado: pode ler; somente o UUID definido na policy pode excluir.
- Mensagens aparecem em tempo real para quem estiver com o mural aberto.

Para divulgar publicamente, recomendamos acrescentar CAPTCHA/limite de frequência contra spam. A linha do tempo está preparada com textos provisórios; as fotos e legendas podem ser inseridas depois.
