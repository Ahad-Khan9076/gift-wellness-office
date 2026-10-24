# GIFT Wellness Care Centre — Landing Page

Flutter web landing page for the GIFT University Wellness Center (mental health support).

## Live site (Vercel — primary)

After you connect this repo on [Vercel](https://vercel.com/new), each push to `main` can auto-deploy.  
Or deploy from your machine:

```bash
chmod +x scripts/deploy_vercel.sh scripts/vercel_build.sh
./scripts/deploy_vercel.sh
```

(Vercel CLI will ask you to log in the first time.)

**GitHub Pages (optional backup):** https://ahad-khan9076.github.io/gift-wellness-office/ — redeploy with `./scripts/deploy_pages.sh`

## Local development

```bash
flutter pub get
flutter run -d chrome
```

## Build for web

**GitHub Pages** (served under a subpath):

```bash
flutter build web --release --base-href "/gift-wellness-office/"
```

**Vercel** (domain root — default base href):

```bash
./scripts/vercel_build.sh
# output: build/web
```

Root `vercel.json` + `web/vercel.json` rewrite all routes to `index.html` for Flutter deep links.

### Connect GitHub to Vercel (recommended)

1. Push this repo to GitHub.
2. Open [vercel.com/new](https://vercel.com/new) → **Import** `Ahad-Khan9076/gift-wellness-office`.
3. Leave settings as detected from `vercel.json` (build: `bash scripts/vercel_build.sh`, output: `build/web`).
4. Click **Deploy**. First build installs Flutter (~3–5 min).
5. Use the `.vercel.app` URL Vercel gives you (optional: add a custom domain in Project → Settings → Domains).
