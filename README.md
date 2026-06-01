# Brooklyn Payge Bracy — Graduation Slideshow
### Class of 2025 · Lakeview Spartans → CMU Chippewas

---

## Quick Start

### Step 1 — Add Your Photos
Drop photos into the matching year folders inside `/photos/`:

| Folder | Years | Era |
|--------|-------|-----|
| `2007-baby` | 2007 | Newborn |
| `2008-toddler` | 2008 | Age 1 |
| `2009-toddler` | 2009 | Age 2 |
| `2010-elementary` | 2010 | Age 3 |
| `2011-elementary` | 2011 | Age 4 |
| `2012-elementary` | 2012 | Age 5 |
| `2013-middle` | 2013 | Age 6 |
| `2014-middle` | 2014 | Age 7 |
| `2015-middle` | 2015 | Age 8 |
| `2016-highschool` | 2016 | Freshman |
| `2017-highschool` | 2017 | Sophomore |
| `2018-highschool` | 2018 | Junior |
| `2019-highschool` | 2019 | Age 12 |
| `2020-highschool` | 2020 | Age 13 |
| `2021-highschool` | 2021 | Age 14 |
| `2022-highschool` | 2022 | Age 15 |
| `2023-senior` | 2023 | Senior begins |
| `2024-senior` | 2024 | Final senior year |
| `2025-graduation` | 2025 | Graduation day |
| `2025-cmu` | 2025 | CMU / Next chapter |

**Tips:**
- JPG or PNG both work fine
- Rename files simply: `001.jpg`, `002.jpg` etc. for easy ordering
- Landscape photos look best (horizontal)
- Try to put 2–5 photos per folder for good pacing

---

### Step 2 — Register Your Photos in index.html
Open `index.html` and find the `ERAS` array near the top of the `<script>` section.

For each era, update the `photos: []` line with your filenames:

```js
// BEFORE (no photos yet):
photos: [],

// AFTER (you added photos):
photos: ['001.jpg', '002.jpg', '003.jpg'],
```

---

### Step 3 — Add the Music
1. Buy "Never Grow Up" by Taylor Swift (iTunes / Amazon ~$1.29)
2. Rename the downloaded file to: `never-grow-up.mp3`
3. Place it in the `/music/` folder

---

### Step 4 — Push to GitHub
```bash
cd C:\projects\brooklyn-graduation
git init
git add .
git commit -m "Brooklyn graduation slideshow"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/brooklyn-graduation.git
git push -u origin main
```

---

### Step 5 — Deploy to Vercel
1. Go to vercel.com and log into your cdblogic account
2. Click **"Add New Project"**
3. Import your `brooklyn-graduation` GitHub repo
4. Leave all settings as default
5. Click **Deploy**

Your site will be live at:
`https://brooklyn-graduation.vercel.app`

---

### Step 6 — Generate QR Code
Go to: **https://qr.io** or **https://www.qr-code-generator.com**
- Enter your Vercel URL
- Download as PNG
- Print it on party invitations, table cards, or a poster!

---

### Step 7 — Update Photos Anytime
Just add more photos, update the `index.html` photo lists, and run:
```bash
git add .
git commit -m "Added more photos"
git push
```
Vercel auto-deploys instantly. No extra steps needed.

---

## Venmo Gift Button
Already wired to **@Brooklyn-Bracy-1** — guests can tap the blue button
in the top right of the slideshow to send Brooklyn a graduation gift.

---

## Features
- Cinematic Ken Burns zoom on every photo
- Silky crossfade dissolve between photos
- Color palette transitions from Lakeview purple → CMU maroon/gold
- "Never Grow Up" background music with mute toggle
- Auto-advances every 5.5 seconds — fully hands-off
- Confetti burst on the final card
- Mobile friendly — works great on phones from the QR code
- Venmo gift link for guests

---

*Made with love for Brooklyn Payge Bracy · Class of 2025*
