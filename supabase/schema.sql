-- Rode no SQL Editor do Supabase. Substitua ADMIN_USER_UUID pelo UUID do seu usuário.
create table if not exists public.birthday_messages (
 id bigint generated always as identity primary key,
 name text not null check (char_length(trim(name)) between 2 and 40),
 message text not null check (char_length(trim(message)) between 2 and 500),
 created_at timestamptz not null default now()
);
alter table public.birthday_messages enable row level security;
revoke all on table public.birthday_messages from anon, authenticated;
grant select, insert on table public.birthday_messages to anon;
grant select, insert, delete on table public.birthday_messages to authenticated;
drop policy if exists "Public can read birthday messages" on public.birthday_messages;
create policy "Public can read birthday messages" on public.birthday_messages for select to anon, authenticated using (true);
drop policy if exists "Visitors can post birthday messages" on public.birthday_messages;
create policy "Visitors can post birthday messages" on public.birthday_messages for insert to anon, authenticated with check (char_length(trim(name)) between 2 and 40 and char_length(trim(message)) between 2 and 500);
drop policy if exists "Only the birthday admin can delete messages" on public.birthday_messages;
create policy "Only the birthday admin can delete messages" on public.birthday_messages for delete to authenticated using ((select auth.uid()) = '359aec46-6add-4105-8f11-21e7d94a2956'::uuid);
-- Habilita as alterações em tempo real na publicação.
alter publication supabase_realtime add table public.birthday_messages;
