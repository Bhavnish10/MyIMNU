# Nexus IMNU

> Everything campus, one place.

A single-file web app for Nirma University MBA students — personal timetables, campus events, case competitions, and an admin console.

---

## Quick Start (GitHub Pages — free)

1. Create a new GitHub repo (e.g. `nexus-imnu`)
2. Push the contents of this folder to the repo
3. Go to **Settings → Pages → Source: Deploy from branch → main → / (root)**
4. Your site is live at `https://<your-username>.github.io/nexus-imnu/`

> Note: Firebase features (auth, cloud data) require the Firebase setup below. Without it, the site runs in **demo mode** with sample data.

---

## Firebase Setup

### 1. Create a Firebase project
- Go to [console.firebase.google.com](https://console.firebase.google.com)
- Create a new project (e.g. "nexus-imnu")
- Enable **Google Analytics** if you want

### 2. Enable Authentication
- Go to **Authentication → Sign-in method**
- Enable **Google** as a provider
- Add your domain to **Authorized domains** (e.g. `your-username.github.io`)

### 3. Create Firestore Database
- Go to **Firestore Database → Create database**
- Choose **production mode**
- Deploy the `firestore.rules` file from this folder

### 4. Get your config
- Go to **Project settings → General → Your apps → Web app**
- Click "Add app" → Register
- Copy the `firebaseConfig` object

### 5. Update index.html
Open `index.html` and find the `CONFIG` object near the top of the `<script>` section. Replace the placeholder values:

```javascript
const CONFIG = {
  firebase: {
    apiKey:            "AIzaSy...",          // your real key
    authDomain:        "nexus-imnu.firebaseapp.com",
    projectId:         "nexus-imnu",
    storageBucket:     "nexus-imnu.appspot.com",
    messagingSenderId: "123456789",
    appId:             "1:123456789:web:abc..."
  },
  adminEmails: ["your-rollnum@nirmauni.ac.in"],
  demoMode: false   // ← change to false
};
```

### 6. Update Firestore rules
In `firestore.rules`, replace `'your-email@nirmauni.ac.in'` with your actual admin email.

### 7. Deploy rules
```bash
npm install -g firebase-tools
firebase login
firebase init  # select Firestore only, use existing project
firebase deploy --only firestore:rules
```

---

## Features

| Feature | Status |
|---------|--------|
| Personal timetable (roll number search) | ✅ Live |
| Agenda + Calendar layout toggle | ✅ Live |
| .ics calendar download | ✅ Live |
| Google Sign-in + roll linking | ✅ Live |
| Admin: Excel upload → Firestore publish | ✅ Live |
| Admin: Accounts dashboard + CSV export | ✅ Live |
| Case competitions feed | ✅ Live |
| Events & announcements | 🔜 Coming soon |
| Notes & case decks | 🔜 Coming soon |

## Excel Format

The admin upload expects `.xlsx` files with these column patterns:

**Student roster sheet:**
| Roll / Enrollment / ID | Name | Division / Section / Group |
|---|---|---|

**Schedule sheet:**
| Day | Start Time / Time / Slot | End Time | Subject / Course | Faculty / Professor | Room / Venue | Division / Section |
|---|---|---|---|---|---|---|

Column names are fuzzy-matched — "Student ID", "Roll No", "Enrollment Number" all work.

---

## Tech Stack

- **Frontend**: Single `index.html` (HTML + CSS + JS, no build step)
- **Auth**: Firebase Authentication (Google Sign-in)
- **Database**: Cloud Firestore (real-time)
- **Excel parsing**: SheetJS (client-side)
- **Hosting**: GitHub Pages (free) or Firebase Hosting
- **Fonts**: Google Fonts (Inter + Playfair Display)

---

Made by Bhavnish Nanda · IMNU, Nirma University
