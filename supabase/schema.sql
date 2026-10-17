-- Run in Supabase Dashboard > SQL Editor.
create table if not exists public.daily_entries (
  user_id uuid not null references auth.users(id) on delete cascade,
  entry_date date not null,
  entry_data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, entry_date)
);
alter table public.daily_entries enable row level security;
revoke all on public.daily_entries from anon;
grant select, insert, update, delete on public.daily_entries to authenticated;
create policy "read own daily entries" on public.daily_entries for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert own daily entries" on public.daily_entries for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own daily entries" on public.daily_entries for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "delete own daily entries" on public.daily_entries for delete to authenticated using ((select auth.uid()) = user_id);
