# GIFT Wellness Care Centre — Landing Page

Flutter web landing page for the GIFT University Wellness Center (mental health support).

## Live site

**https://ahad-khan9076.github.io/gift-wellness-office/**

Redeploy after changes:

```bash
chmod +x scripts/deploy_pages.sh
./scripts/deploy_pages.sh
```

## Local development

```bash
flutter pub get
flutter run -d chrome
```

## Build for web

```bash
flutter build web --release --base-href "/gift-wellness-office/"
```

GitHub Actions deploys to GitHub Pages on every push to `main`.
