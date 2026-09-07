# Flutter Experiment 2 – Adaptive and Responsive UI Design

**Course Code**: 24CS2016  
**Project Name**: `responsive_ui`  
**Expected Result**: A Flutter application that automatically adapts its layout according to screen size (`< 600px` Mobile Column vs `≥ 600px` Desktop Horizontal Row).

---

## 📌 Project Overview & Structure

This project implements all steps from Experiment 2 in the lab manual:

- **Step 4 – LayoutBuilder**: Dynamically detects screen width constraints (`constraints.maxWidth < 600`).
- **Step 5 – Mobile Layout**: Vertical `Column` containing list cards (**Student**, **Courses**, **Faculty**).
- **Step 6 – Desktop Layout**: Horizontal `Row` using `Expanded` widgets to display rich side-by-side cards.
- **Step 7 – Screen Size Testing**: Real-time feedback bar displaying exact pixel width and active layout mode.

---

## 🚀 How to Deploy to a New GitHub Repository

### Step 1: Create a New GitHub Repository
Go to GitHub and create a new repository (e.g. `flutter_exp_2`).

### Step 2: Push Code using `deploy.sh`
Run inside `/home/frost/git/responsive_ui`:
```bash
./deploy.sh
```
When prompted, enter your repository URL:
```text
https://github.com/YOUR_USERNAME/flutter_exp_2.git
```

### Step 3: Enable GitHub Pages
1. Go to repository **Settings ➔ Pages**.
2. Set **Source** to `Deploy from a branch`.
3. Select **`gh-pages`** branch and `/ (root)`.
4. Click **Save**.

Your live app will be published at:
`https://YOUR_USERNAME.github.io/flutter_exp_2/`
