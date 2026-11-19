-- CTL Financial Intelligence — Supabase/PostgreSQL starter schema
create table if not exists sources (
  id bigint generated always as identity primary key,
  name text not null unique,
  url text,
  category text,
  reliability_class text,
  reliability_score integer check (reliability_score between 1 and 5),
  verification_status text not null default 'pending',
  notes text,
  updated_at timestamptz not null default now()
);
create table if not exists market_observations (
  id bigint generated always as identity primary key,
  instrument text not null,
  value numeric not null,
  unit text not null,
  observed_at timestamptz not null,
  collected_at timestamptz not null default now(),
  source_id bigint references sources(id),
  source_url text,
  status text not null check (status in ('confirmed','estimated','demo','stale','unverified')),
  notes text,
  unique(instrument, observed_at, source_id)
);
create index if not exists idx_market_obs_instrument_time
  on market_observations(instrument, observed_at desc);
create table if not exists macro_indicators (
  id bigint generated always as identity primary key,
  indicator text not null,
  geography text not null,
  value numeric not null,
  unit text not null,
  reference_period text not null,
  published_at timestamptz,
  collected_at timestamptz not null default now(),
  source_id bigint references sources(id),
  source_url text,
  status text not null check (status in ('confirmed','estimated','unverified','stale')),
  notes text
);
create table if not exists editorial_checks (
  id bigint generated always as identity primary key,
  edition_date date not null,
  rubric_code text not null,
  check_type text not null,
  status text not null,
  evidence_url text,
  checked_at timestamptz,
  notes text
);
