-- DENBROWN public photo manager
-- Run this entire script in Supabase > SQL Editor > New query.
create table if not exists public.denbrown_profile_photos (
  slot text primary key,
  image_url text not null,
  updated_at timestamptz not null default now()
);
alter table public.denbrown_profile_photos enable row level security;

drop policy if exists "Public can view DENBROWN photos" on public.denbrown_profile_photos;
create policy "Public can view DENBROWN photos"
on public.denbrown_profile_photos for select
to anon, authenticated using (true);

drop policy if exists "DENBROWN admin can manage photos" on public.denbrown_profile_photos;
create policy "DENBROWN admin can manage photos"
on public.denbrown_profile_photos for all
to authenticated
using ((auth.jwt() ->> 'email') = 'denmitter300@gmail.com')
with check ((auth.jwt() ->> 'email') = 'denmitter300@gmail.com');

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('denbrown-profile', 'denbrown-profile', true, 10485760, array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public = true, file_size_limit = 10485760, allowed_mime_types = array['image/jpeg','image/png','image/webp'];

drop policy if exists "Public can view DENBROWN profile images" on storage.objects;
create policy "Public can view DENBROWN profile images"
on storage.objects for select
to anon, authenticated using (bucket_id = 'denbrown-profile');

drop policy if exists "DENBROWN admin can upload profile images" on storage.objects;
create policy "DENBROWN admin can upload profile images"
on storage.objects for insert
to authenticated
with check (bucket_id = 'denbrown-profile' and (auth.jwt() ->> 'email') = 'denmitter300@gmail.com');

drop policy if exists "DENBROWN admin can update profile images" on storage.objects;
create policy "DENBROWN admin can update profile images"
on storage.objects for update
to authenticated
using (bucket_id = 'denbrown-profile' and (auth.jwt() ->> 'email') = 'denmitter300@gmail.com')
with check (bucket_id = 'denbrown-profile' and (auth.jwt() ->> 'email') = 'denmitter300@gmail.com');

drop policy if exists "DENBROWN admin can delete profile images" on storage.objects;
create policy "DENBROWN admin can delete profile images"
on storage.objects for delete
to authenticated
using (bucket_id = 'denbrown-profile' and (auth.jwt() ->> 'email') = 'denmitter300@gmail.com');
