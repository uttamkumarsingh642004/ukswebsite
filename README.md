# Modern Portfolio Website - Flutter

A stunning, modern, and interactive personal portfolio website built with Flutter. Features smooth animations, dark theme with colorful accents, and fully responsive design for desktop and mobile.

## ✨ Features

- **Smooth Animations**: Fade, slide, scale, and parallax effects throughout
- **Dark Theme**: Modern dark design with customizable accent colors
- **Fully Responsive**: Optimized for desktop, tablet, and mobile
- **Interactive Elements**: Hover effects, animated cards, and floating navigation
- **Modern Typography**: Google Fonts (Poppins & Inter) for clean, professional look
- **Sections**:
  - Landing/Hero with animated introduction
  - About with professional bio and stats
  - Projects gallery with expandable cards
  - Skills with interactive badges
  - Contact form with social media links
  - Clean footer with navigation

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (3.0.0 or higher)
- Dart SDK
- A code editor (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/portfolio-website.git
   cd portfolio-website
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**

   For web:
   ```bash
   flutter run -d chrome
   ```

   For desktop:
   ```bash
   flutter run -d macos    # macOS
   flutter run -d windows  # Windows
   flutter run -d linux    # Linux
   ```

## 🎨 Customization Guide

### 1. Personal Information

**Update your details in:**

- `lib/sections/hero_section.dart`:
  - Line 97: Your name
  - Line 114-130: Your taglines/titles
  - Line 138: Your summary/bio
  - Add your profile image path at line 189

- `lib/sections/about_section.dart`:
  - Lines 120-138: Your professional bio
  - Lines 148-150: Your stats (years, projects, clients)
  - Lines 193-198: Your interests
  - Lines 236-241: Your core values

- `lib/sections/contact_section.dart`:
  - Lines 30-54: Your social media links
  - Lines 216-226: Your contact information

- `lib/sections/footer_section.dart`:
  - Line 70: Your name/brand

### 2. Projects

**Edit `lib/sections/projects_section.dart`:**

Replace the sample projects (lines 24-85) with your actual projects:

```dart
Project(
  title: 'Your Project Name',
  description: 'Project description...',
  imageUrl: 'assets/images/your-project.png',
  techStack: ['Flutter', 'Firebase', 'etc'],
  demoUrl: 'https://your-demo-url.com',
  githubUrl: 'https://github.com/yourusername/project',
  category: 'Web',
)
```

### 3. Skills

**Edit `lib/sections/skills_section.dart`:**

Update your skills (lines 21-43):

```dart
SkillData('Skill Name', FontAwesomeIcons.icon, 85, Color(0xFF...)),
```

### 4. Brand Colors

**Edit `lib/utils/app_theme.dart`:**

Customize colors (lines 10-18):

```dart
static const Color primaryAccent = Color(0xFF6C63FF);    // Main accent
static const Color secondaryAccent = Color(0xFF4ECDC4);  // Secondary
static const Color tertiaryAccent = Color(0xFFFF6B6B);   // Tertiary
static const Color backgroundDark = Color(0xFF0A0E27);   // Background
```

### 5. Assets

Create the following directories and add your assets:

```
assets/
├── images/
│   ├── profile.png          # Your profile photo
│   ├── project1.png         # Project screenshots
│   ├── project2.png
│   └── ...
├── icons/
│   └── logo.png            # Optional logo
└── svg/
    └── ...                 # SVG graphics
```

## 📱 Building for Production

### Build for Web

```bash
flutter build web --release
```

The output will be in `build/web/`

### Build for Desktop

```bash
# macOS
flutter build macos --release

# Windows
flutter build windows --release

# Linux
flutter build linux --release
```

## 🌐 Deployment

### Option 1: GitHub Pages (Automated) ✅

**This repository is already set up for automatic GitHub Pages deployment!**

Every time you push to the `main` or `master` branch, your website will automatically build and deploy.

**To enable:**

1. **Go to your repository settings** on GitHub
   - Navigate to `Settings` → `Pages`

2. **Configure source**
   - Source: `Deploy from a branch`
   - Branch: `gh-pages`
   - Folder: `/ (root)`

3. **Save and wait** (first deployment takes 2-3 minutes)

4. **Your site will be live at:**
   ```
   https://yourusername.github.io/ukswebsite/
   ```

**Adding a custom domain:**
- Go to Settings → Pages → Custom domain
- Enter your domain (e.g., `www.yourname.com`)
- Update your DNS settings with a CNAME record pointing to `yourusername.github.io`

**Manual deployment (if needed):**
```bash
flutter build web --release --base-href "/ukswebsite/"
# Then push the build/web contents to gh-pages branch
```

### Option 2: Firebase Hosting

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Initialize Firebase**
   ```bash
   firebase login
   firebase init hosting
   ```
   - Select `build/web` as the public directory
   - Configure as single-page app: Yes
   - Don't overwrite index.html

3. **Deploy**
   ```bash
   flutter build web --release
   firebase deploy
   ```

4. **Custom Domain**
   - Go to Firebase Console → Hosting
   - Click "Add custom domain"
   - Follow the instructions to verify and configure DNS

### Option 3: Vercel

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Build and Deploy**
   ```bash
   flutter build web --release
   cd build/web
   vercel
   ```

3. **Custom Domain**
   - Go to Vercel dashboard
   - Settings → Domains
   - Add your custom domain

### Option 4: Netlify

1. **Build**
   ```bash
   flutter build web --release
   ```

2. **Deploy via Netlify CLI**
   ```bash
   npm install -g netlify-cli
   netlify deploy --dir=build/web --prod
   ```

3. **Or drag & drop**
   - Go to [Netlify Drop](https://app.netlify.com/drop)
   - Drag the `build/web` folder


## 📄 Adding Additional Features

### 1. Downloadable Resume

Add a download button in the About section:

```dart
ElevatedButton.icon(
  onPressed: () async {
    final url = Uri.parse('assets/resume.pdf');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  },
  icon: Icon(Icons.download),
  label: Text('Download Resume'),
)
```

Don't forget to add `resume.pdf` to `assets/` and update `pubspec.yaml`.

### 2. Blog Section

Create `lib/sections/blog_section.dart`:

```dart
// Similar structure to projects section
// Use a model for blog posts with title, excerpt, date, etc.
```

### 3. Dark/Light Theme Toggle

Add theme switching in `lib/main.dart`:

```dart
// Use Provider or Riverpod for state management
// Add a toggle button in the nav bar
```

## 🎯 Advanced Customization Ideas

### 1. Three.js-like 3D Graphics

Use `flutter_gl` package:
```yaml
dependencies:
  flutter_gl: ^0.0.25
```

Add 3D background animations in the hero section.

### 2. Particle Effects

Use `simple_animations` or `particles_flutter`:
```yaml
dependencies:
  simple_animations: ^5.0.2
```

Add particle effects to backgrounds or interactions.

### 3. Custom Cursor

Implement a custom cursor for desktop:
```dart
MouseRegion(
  cursor: SystemMouseCursors.click,
  child: // your widget
)
```

### 4. Dynamic Theme System

Create multiple color schemes and allow users to switch:
```dart
// Define multiple themes
// Use shared_preferences to save preference
```

### 5. Analytics Integration

Add Google Analytics or Plausible:
```yaml
dependencies:
  firebase_analytics: ^10.7.4
```

### 6. Internationalization (i18n)

Support multiple languages:
```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.1
```

## 🔧 Troubleshooting

### Issue: White screen on web build

**Solution**: Ensure `index.html` has proper base href:
```html
<base href="/">
```

### Issue: Assets not loading

**Solution**: Verify `pubspec.yaml` includes:
```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/svg/
```

### Issue: Animations not smooth

**Solution**: Use `RepaintBoundary` for complex widgets:
```dart
RepaintBoundary(
  child: YourWidget(),
)
```

## 📦 Project Structure

```
lib/
├── main.dart                  # App entry point
├── models/
│   └── project_model.dart     # Data models
├── screens/
│   └── home_screen.dart       # Main screen
├── sections/
│   ├── hero_section.dart      # Landing section
│   ├── about_section.dart     # About section
│   ├── projects_section.dart  # Projects section
│   ├── skills_section.dart    # Skills section
│   ├── contact_section.dart   # Contact section
│   └── footer_section.dart    # Footer section
├── utils/
│   ├── app_theme.dart         # Theme configuration
│   └── responsive.dart        # Responsive utilities
└── widgets/
    ├── animated_background.dart
    ├── animated_card.dart
    ├── custom_scroll_behavior.dart
    ├── floating_nav_bar.dart
    ├── gradient_text.dart
    ├── project_card.dart
    ├── section_title.dart
    ├── skill_badge.dart
    └── social_icon_button.dart
```

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 💬 Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter)

Project Link: [https://github.com/yourusername/portfolio-website](https://github.com/yourusername/portfolio-website)

---

**Built with ❤️ using Flutter**
