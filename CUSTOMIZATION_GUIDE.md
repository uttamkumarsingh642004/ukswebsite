# Quick Customization Guide

This guide will help you customize your portfolio website quickly. Follow these steps to make it yours!

## 🚀 Quick Start (5 minutes)

### Step 1: Update Personal Information

1. **Open `lib/sections/hero_section.dart`**
   - Line 97: Replace `'Your Name'` with your actual name
   - Lines 114-130: Update the rotating taglines (e.g., 'Full-Stack Developer', 'UI/UX Designer')
   - Line 138: Replace the bio text with your own summary

2. **Open `lib/sections/contact_section.dart`**
   - Lines 30-54: Update all social media URLs with your actual profiles
   - Lines 216-226: Update your location, email, and phone number

### Step 2: Choose Your Colors

**Open `lib/utils/app_theme.dart` (Lines 10-18)**

Pick colors from [coolors.co](https://coolors.co) or [color.adobe.com](https://color.adobe.com):

```dart
static const Color primaryAccent = Color(0xFF6C63FF);    // Your main brand color
static const Color secondaryAccent = Color(0xFF4ECDC4);  // Complementary color
static const Color tertiaryAccent = Color(0xFFFF6B6B);   // Accent color
```

### Step 3: Add Your Photo

1. Add your profile photo to `assets/images/profile.png`
2. **Open `lib/sections/hero_section.dart`** (Line 189)
3. Uncomment and update:
```dart
image: DecorationImage(
  image: AssetImage('assets/images/profile.png'),
  fit: BoxFit.cover,
),
```

### Step 4: Test It!

```bash
flutter pub get
flutter run -d chrome
```

## 📝 Detailed Customization (30 minutes)

### Update Your Bio & Stats

**`lib/sections/about_section.dart`:**

1. **Lines 120-138**: Write 2-3 paragraphs about yourself
2. **Line 148**: Update years of experience
3. **Line 149**: Update number of projects
4. **Line 150**: Update number of clients
5. **Lines 193-198**: List 3-5 of your interests
6. **Lines 236-241**: List your core values

### Add Your Projects

**`lib/sections/projects_section.dart` (Lines 24-85)**

Replace sample projects with yours:

```dart
Project(
  title: 'My Awesome App',
  description: 'A detailed description of what this project does...',
  imageUrl: 'assets/images/my_project.png',  // Add screenshot
  techStack: ['Flutter', 'Firebase', 'Node.js'],
  demoUrl: 'https://myapp.com',
  githubUrl: 'https://github.com/username/project',
  category: 'Mobile',
),
```

**Tips:**
- Add 4-6 of your best projects
- Use high-quality screenshots (1200x800px recommended)
- Be specific about technologies used
- Include both personal and professional projects

### Update Your Skills

**`lib/sections/skills_section.dart` (Lines 21-43)**

Organize skills by category:

```dart
'Frontend': [
  SkillData('React', FontAwesomeIcons.react, 90, Color(0xFF61DAFB)),
  // proficiency: 0-100
],
'Backend': [
  SkillData('Node.js', FontAwesomeIcons.node, 85, Color(0xFF339933)),
],
'Tools': [
  SkillData('Git', FontAwesomeIcons.git, 90, Color(0xFFF05032)),
],
```

**Find icon names at:** [fontawesome.com/icons](https://fontawesome.com/icons)

### Customize Typography

**`lib/utils/app_theme.dart` (Lines 34-74)**

Try different font combinations from [Google Fonts](https://fonts.google.com):

```dart
// Change Poppins to another font:
displayLarge: GoogleFonts.montserrat(...),

// Change Inter to another font:
bodyLarge: GoogleFonts.roboto(...),
```

**Popular combinations:**
- Headings: Montserrat, Raleway, Playfair Display
- Body: Roboto, Open Sans, Lato

## 🎨 Advanced Customization

### Change Animation Styles

**Hero Section Animations** (`lib/sections/hero_section.dart`):

```dart
// Adjust animation speed
.animate()
.fadeIn(duration: 600.ms)  // Change to 300.ms for faster
.slideX(begin: -0.2)        // Change to -0.5 for more movement
```

### Customize Card Styles

**`lib/utils/app_theme.dart` (Lines 20-26)**:

```dart
static const double radiusS = 8.0;   // Small radius
static const double radiusM = 16.0;  // Medium radius
static const double radiusL = 24.0;  // Large radius - increase for more rounded
```

### Add Custom Sections

1. Create new file: `lib/sections/testimonials_section.dart`
2. Copy structure from `about_section.dart`
3. Add to `lib/screens/home_screen.dart`:

```dart
// Add after skills section
Container(
  key: _sectionKeys[5],  // Add new key to list
  child: const TestimonialsSection(),
),
```

## 📸 Asset Guidelines

### Profile Photo
- **Size**: 800x800px minimum
- **Format**: PNG with transparent background (or JPG)
- **Style**: Professional headshot or creative portrait

### Project Screenshots
- **Size**: 1200x800px (3:2 ratio)
- **Format**: PNG or JPG
- **Quality**: High resolution, clear UI
- **Tip**: Use [Screely](https://screely.com) for mockups

### Icons & Logos
- **Size**: 512x512px
- **Format**: SVG preferred, PNG acceptable
- **Style**: Match your brand colors

## 🎯 Pre-Launch Checklist

- [ ] Updated all personal information
- [ ] Changed brand colors to match your style
- [ ] Added profile photo
- [ ] Added 4-6 real projects with screenshots
- [ ] Updated skills to reflect your expertise
- [ ] Tested all social media links
- [ ] Updated contact information
- [ ] Tested on mobile (use Chrome DevTools)
- [ ] Tested on different browsers
- [ ] Checked all animations work smoothly
- [ ] Added favicon (see below)
- [ ] Updated meta tags for SEO (see below)

## 🌐 Before Deploying

### Add Favicon

1. Create favicon at [favicon.io](https://favicon.io)
2. Add to `web/` folder
3. Update `web/index.html`:

```html
<link rel="icon" type="image/png" href="favicon.png"/>
```

### SEO Meta Tags

Update `web/index.html`:

```html
<title>Your Name - Full Stack Developer</title>
<meta name="description" content="Portfolio of Your Name, a full-stack developer specializing in Flutter and web development.">
<meta property="og:title" content="Your Name - Portfolio">
<meta property="og:description" content="Check out my latest projects and get in touch!">
<meta property="og:image" content="https://yoursite.com/og-image.png">
```

## 💡 Common Questions

**Q: How do I change the entire color scheme?**
A: Update all color values in `lib/utils/app_theme.dart`. Use a color palette generator like Coolors.

**Q: Can I use different fonts?**
A: Yes! Browse [Google Fonts](https://fonts.google.com), then update imports in `app_theme.dart`.

**Q: How do I add more projects?**
A: Simply add more `Project()` objects to the list in `projects_section.dart`.

**Q: The contact form doesn't work!**
A: You need to implement the backend. See README.md for options (EmailJS, Firebase Functions, etc.).

**Q: How do I change animation speeds globally?**
A: Search for `.animate()` calls and adjust `duration` values. Lower = faster.

## 🆘 Need Help?

- Check the main README.md for detailed instructions
- Review Flutter documentation: [flutter.dev](https://flutter.dev)
- Ask in GitHub Issues
- Join Flutter community on Discord

---

**Happy customizing! 🎉**
