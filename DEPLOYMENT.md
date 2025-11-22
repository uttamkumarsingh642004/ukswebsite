# 🚀 GitHub Pages Deployment Instructions

Your Flutter portfolio website is **ready to deploy** to GitHub Pages! Follow these simple steps to make it live.

## ✅ Setup Complete

The following has already been configured:
- ✅ GitHub Actions workflow for automatic deployment
- ✅ Web build configuration with correct base URL
- ✅ Responsive design for all devices
- ✅ SEO meta tags and manifest
- ✅ Icon placeholders

## 📋 Steps to Deploy (5 minutes)

### Step 1: Merge to Main Branch

Since the code is currently on a feature branch, you need to merge it to `main` to trigger deployment:

**Option A: Via GitHub Web Interface (Recommended)**

1. Go to your repository on GitHub:
   ```
   https://github.com/uttamkumarsingh642004/ukswebsite
   ```

2. Click on **"Pull requests"** tab

3. Click **"New pull request"**

4. Set:
   - Base: `main` (or create it if it doesn't exist)
   - Compare: `claude/create-portfolio-website-013eaQb2rDcM7zMNFevUA7YH`

5. Click **"Create pull request"**

6. Add a title like "Deploy Flutter Portfolio Website"

7. Click **"Merge pull request"** → **"Confirm merge"**

**Option B: Via Command Line**

```bash
# If main branch doesn't exist, create it
git checkout -b main
git push -u origin main

# Then merge the feature branch on GitHub
```

### Step 2: Wait for Build (2-3 minutes)

Once merged to `main`:

1. Go to **"Actions"** tab in your GitHub repository
2. You'll see a workflow running called **"Deploy to GitHub Pages"**
3. Wait for it to complete (green checkmark ✅)

### Step 3: Enable GitHub Pages

1. Go to **Settings** → **Pages** (in the left sidebar)

2. Under **"Source"**, select:
   - **Branch**: `gh-pages`
   - **Folder**: `/ (root)`

3. Click **Save**

4. Wait 30-60 seconds for deployment

5. **Your site will be live at:**
   ```
   https://uttamkumarsingh642004.github.io/ukswebsite/
   ```

### Step 4: Verify Deployment

Visit your site URL and check:
- [ ] All sections load correctly
- [ ] Animations work smoothly
- [ ] Responsive design works on mobile (test with DevTools)
- [ ] All links work correctly
- [ ] Contact form displays properly

## 🎨 Before Going Live - Checklist

Make sure to customize your portfolio first!

### Essential Updates:

1. **Personal Information**
   - [ ] Update your name in `lib/sections/hero_section.dart`
   - [ ] Add your bio in `lib/sections/about_section.dart`
   - [ ] Update social links in `lib/sections/contact_section.dart`
   - [ ] Add your profile photo to `assets/images/profile.png`

2. **Content**
   - [ ] Add your real projects in `lib/sections/projects_section.dart`
   - [ ] Update skills in `lib/sections/skills_section.dart`
   - [ ] Add project screenshots to `assets/images/`

3. **Branding**
   - [ ] Choose your brand colors in `lib/utils/app_theme.dart`
   - [ ] Generate and add favicon and icons (see `web/icons/README.txt`)
   - [ ] Update site title and meta description in `web/index.html`

4. **SEO & Meta**
   - [ ] Update title in `web/index.html`
   - [ ] Update meta description
   - [ ] Update Open Graph tags
   - [ ] Add your Twitter/social handles

See **CUSTOMIZATION_GUIDE.md** for detailed instructions!

## 🔄 Future Updates

After the initial deployment, any changes you push to the `main` branch will **automatically redeploy** your site!

### To update your site:

1. Make your changes locally
2. Commit and push to `main`:
   ```bash
   git add .
   git commit -m "Update portfolio content"
   git push origin main
   ```
3. Wait 2-3 minutes for automatic deployment

## 🌐 Custom Domain (Optional)

Want to use your own domain like `www.yourname.com`?

1. **In GitHub:**
   - Settings → Pages → Custom domain
   - Enter your domain
   - Save

2. **In your domain registrar:**
   - Add a CNAME record pointing to: `uttamkumarsingh642004.github.io`
   - Or for apex domain, add A records:
     ```
     185.199.108.153
     185.199.109.153
     185.199.110.153
     185.199.111.153
     ```

3. Wait for DNS propagation (can take up to 24 hours)

## ❓ Troubleshooting

### Build fails in GitHub Actions

- Check the Actions tab for error details
- Most common: missing dependencies or syntax errors
- Fix the error and push again

### Site shows 404

- Make sure GitHub Pages is enabled in Settings
- Verify source is set to `gh-pages` branch
- Check that the workflow completed successfully

### Animations not working

- Clear browser cache
- Check browser console for JavaScript errors
- Ensure Flutter web build completed successfully

### Images not loading

- Verify images are in `assets/images/` folder
- Check `pubspec.yaml` includes the assets
- Rebuild and redeploy

## 📞 Need Help?

- Check the main **README.md** for detailed documentation
- Review **CUSTOMIZATION_GUIDE.md** for content updates
- Open an issue on GitHub if you encounter problems

---

## 🎉 Ready to Launch!

Once you complete these steps, your beautiful portfolio will be live for the world to see!

**Next Steps:**
1. Merge to main branch
2. Enable GitHub Pages
3. Customize with your information
4. Share your portfolio URL!

Good luck! 🚀
