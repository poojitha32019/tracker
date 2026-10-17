# My Daily Planner — Lavender Floral Edition

Responsive static HTML planner for Vercel + Supabase.

## Features
- Mobile and desktop responsive UI with lavender floral artwork
- Date-specific records, water tracker, steps goal, habits, mood, crying check-in
- To-do list, custom collapsible schedule editor, notes
- Supabase email/password authentication and per-user cloud sync
- PostgreSQL row-level security

## 1. Set up Supabase
1. Create a project at https://supabase.com/.
2. In SQL Editor, run the entire `supabase/schema.sql` file.
3. Find the Project URL and public anon/publishable key in the project API settings.
4. In `index.html`, replace:
   - `https://bbdrtyjfeokuzmoiztmt.supabase.co`
   - `sb_publishable_KVEcBq9uvr8_BWGmuiiO-Q_IRTnTHG9`
   with your actual values, keeping the single quotes.
5. Never put a `service_role` or secret key in frontend code.
6. In Supabase Authentication settings, decide whether email confirmation is enabled. If enabled, users must confirm their email before signing in.

## 2. Push to GitHub (Windows Command Prompt)
Extract this ZIP. Open Command Prompt in the extracted folder (the folder containing `index.html`):
```bat
git init
git add .
git commit -m "Add lavender daily planner"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
git push -u origin main
```
Replace the remote URL. If this folder already has a `.git` directory, skip `git init`. If the remote is already configured, skip `git remote add origin`.

## 3. Deploy to Vercel
1. Sign in at https://vercel.com/ with GitHub.
2. Add New > Project > import your repository.
3. Choose **Other** as framework preset. No build command is needed; the root `index.html` is served as a static site.
4. Deploy and copy the generated `https://...vercel.app` URL.
5. In Supabase Authentication > URL Configuration, set Site URL to your Vercel URL and add that URL to Redirect URLs.
6. Test sign-up and sign-in on the deployed site. Sign in with the same account on laptop and phone.

## How cloud storage works
Each user/date combination is one row in `daily_entries`; the planner data is saved as JSON. Supabase Auth provides the user identity and RLS policies restrict rows to that user. Changes sync after a short delay. Browser local storage is also kept as a fallback, but cloud data is what synchronizes across devices.

## Free plan
Vercel and Supabase offer free options, subject to current quotas and terms. Review their pricing pages before relying on them long-term: https://vercel.com/pricing and https://supabase.com/pricing.

## Troubleshooting
- **Sign-up asks for email confirmation:** confirm your email and then sign in.
- **Invalid API key:** check the Project URL and public anon/publishable key.
- **Cloud save fails:** verify the SQL ran successfully and the RLS policies exist.
- **Different data on phone:** sign in to the same account and open the same deployed URL.
