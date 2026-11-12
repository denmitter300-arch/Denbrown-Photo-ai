-- DENBROWN public album list
-- Run this script in Supabase SQL Editor after the original supabase-setup.sql.
create table if not exists public.denbrown_profile_albums (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  event_date date,
  location text,
  cover_url text not null,
  photo_urls jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);
alter table public.denbrown_profile_albums enable row level security;

drop policy if exists "Public can view DENBROWN albums" on public.denbrown_profile_albums;
create policy "Public can view DENBROWN albums"
on public.denbrown_profile_albums for select
to anon, authenticated using (true);

drop policy if exists "DENBROWN admin can manage albums" on public.denbrown_profile_albums;
create policy "DENBROWN admin can manage albums"
on public.denbrown_profile_albums for all
to authenticated
using ((auth.jwt() ->> 'email') = 'denmitter300@gmail.com')
with check ((auth.jwt() ->> 'email') = 'denmitter300@gmail.com');
