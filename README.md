# Brooklyn Payge Bracy — Graduation Slideshow
### Class of 2025 · Lakeview Spartans → CMU Chippewas

---

## Quick Start

### Step 1 — Add Your Photos
Drop photos into the matching year folders inside `/photos/`:

| Folder | School Year | Grade / Era |
|--------|-------------|-------------|
| `2007-baby` | — | Newborn |
| `2008-toddler` | — | Age 1 |
| `2009-toddler` | — | Age 2 |
| `2010-age3` | — | Age 3 |
| `2011-age4` | — | Age 4 |
| `2012-age5` | — | Age 5 |
| `2013-kindergarten` | 2013–2014 | Kindergarten (age 5–6) |
| `2014-1st-grade` | 2014–2015 | 1st Grade (age 6–7) |
| `2015-2nd-grade` | 2015–2016 | 2nd Grade (age 7–8) |
| `2016-3rd-grade` | 2016–2017 | 3rd Grade (age 8–9) |
| `2017-4th-grade` | 2017–2018 | 4th Grade (age 9–10) |
| `2018-5th-grade` | 2018–2019 | 5th Grade (age 10–11) |
| `2019-6th-grade` | 2019–2020 | 6th Grade (age 11–12) |
| `2020-7th-grade` | 2020–2021 | 7th Grade (age 12–13) |
| `2021-8th-grade` | 2021–2022 | 8th Grade (age 13–14) |
| `2022-freshman` | 2022–2023 | Freshman / 9th Grade (age 14–15) |
| `2023-sophomore` | 2023–2024 | Sophomore / 10th Grade (age 15–16) |
| `2024-junior` | 2024–2025 | Junior / 11th Grade (age 16–17) |
| `2025-senior` | 2025–2026 | Senior / 12th Grade · Graduates June 2026 |
| `2026-graduation` | Summer 2026 | Post-graduation · Class of 2026 |

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
