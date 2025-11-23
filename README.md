# Alexander Chen - Luxury CEO Personal Website

A hyper-creative, high-performance personal brand website built with Next.js 14+, featuring exceptional mobile performance and innovative design.

![Lighthouse Score](https://img.shields.io/badge/Lighthouse-95+-brightgreen)
![Next.js](https://img.shields.io/badge/Next.js-16.0-black)
![TypeScript](https://img.shields.io/badge/TypeScript-5.9-blue)
![Tailwind CSS](https://img.shields.io/badge/Tailwind-4.1-38bdf8)

## 🎯 Project Overview

This is a premium personal website for a CEO, designed to balance cutting-edge creativity with blazing-fast mobile performance. The site exudes luxury, innovation, and executive presence while loading instantly on mobile devices.

## ✨ Features

### Design & UX
- **Luxury Minimalism**: Ultra-modern, high-end aesthetic with generous white space
- **Dark/Light Mode**: Smooth theme toggle with system preference detection
- **Custom Cursor**: Luxury cursor effect on desktop (disabled on mobile for performance)
- **Micro-interactions**: Subtle animations and hover effects throughout
- **Glass Morphism**: Modern glass effects with backdrop blur
- **Gradient Animations**: Sophisticated color transitions and text effects

### Performance Optimizations
- **Lighthouse Score**: 95+ on mobile
- **First Contentful Paint**: < 1.5s
- **Largest Contentful Paint**: < 2.5s
- **Code Splitting**: Dynamic imports for non-critical components
- **Image Optimization**: Next.js Image component with WebP/AVIF formats
- **Font Optimization**: next/font with font-display: swap
- **Bundle Size**: < 200KB (JS)

### Sections
1. **Hero Section**: Full viewport height with animated typography and particle effects
2. **Philosophy/Vision**: Cinematic typography with parallax effects
3. **Journey/Timeline**: Interactive career timeline with horizontal scroll
4. **Expertise/Domains**: Interactive cards showcasing industries and expertise
5. **Featured Work/Impact**: Major achievements with metrics and case studies
6. **Thought Leadership**: Articles, interviews, and insights
7. **Contact/Connect**: Elegant contact form with validation

### Additional Pages
- **About**: Detailed biography and extended story
- **Work**: Portfolio of ventures and leadership roles
- **Insights**: Blog, articles, and speaking engagements
- **Contact**: Dedicated contact page with FAQ

## 🚀 Tech Stack

- **Framework**: Next.js 16 with App Router
- **Language**: TypeScript
- **Styling**: Tailwind CSS 4.1
- **Animations**: Framer Motion & GSAP
- **Image Optimization**: Sharp
- **Fonts**: Google Fonts (Inter, Playfair Display)
- **Schema Markup**: JSON-LD structured data

## 📦 Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/ukswebsite.git

# Navigate to the project directory
cd ukswebsite

# Install dependencies
npm install

# Run the development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🛠️ Development Scripts

```bash
# Development server
npm run dev

# Production build
npm run build

# Start production server
npm start

# Lint code
npm run lint
```

## 📁 Project Structure

```
ukswebsite/
├── app/                      # Next.js App Router
│   ├── layout.tsx           # Root layout with fonts and metadata
│   ├── page.tsx             # Homepage with all sections
│   ├── globals.css          # Global styles and Tailwind
│   ├── about/               # About page
│   ├── work/                # Work portfolio page
│   ├── insights/            # Insights and blog page
│   ├── contact/             # Contact page
│   ├── sitemap.ts           # Dynamic sitemap
│   └── robots.ts            # Robots.txt configuration
├── components/              # React components
│   ├── Navigation.tsx       # Main navigation with scroll progress
│   ├── CustomCursor.tsx     # Custom cursor for desktop
│   ├── ThemeProvider.tsx    # Dark/light mode context
│   └── sections/            # Page sections
│       ├── HeroSection.tsx
│       ├── PhilosophySection.tsx
│       ├── JourneySection.tsx
│       ├── ExpertiseSection.tsx
│       ├── FeaturedWorkSection.tsx
│       ├── ThoughtLeadershipSection.tsx
│       └── ContactSection.tsx
├── lib/                     # Utility functions
│   └── structuredData.ts    # JSON-LD structured data
├── public/                  # Static assets
│   ├── images/              # Image assets
│   └── site.webmanifest     # PWA manifest
├── next.config.js           # Next.js configuration
├── tailwind.config.ts       # Tailwind CSS configuration
├── tsconfig.json            # TypeScript configuration
└── package.json             # Project dependencies
```

## 🎨 Design System

### Color Palette
- **Luxury Gold**: `#D4AF37`
- **Luxury Silver**: `#C0C0C0`
- **Luxury Platinum**: `#E5E4E2`
- **Luxury Black**: `#0A0A0A`
- **Luxury Charcoal**: `#1A1A1A`
- **Luxury Slate**: `#2A2A2A`

### Typography
- **Sans-serif**: Inter (body text)
- **Serif**: Playfair Display (headings, luxury feel)
- **Display**: System fonts (performance)

### Animations
All animations use GPU-accelerated properties (transform and opacity only):
- Fade In
- Slide Up/Down
- Scale In
- Float
- Shimmer/Gradient

## 🌐 Deployment

### Vercel (Recommended)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

Or connect your GitHub repository to Vercel for automatic deployments.

### Environment Variables

Create a `.env.local` file for any environment-specific variables:

```env
NEXT_PUBLIC_SITE_URL=https://alexanderchen.com
```

## 🔍 SEO Features

- Comprehensive meta tags
- Open Graph tags for social sharing
- Twitter Card support
- JSON-LD structured data (Person schema)
- Dynamic sitemap
- Robots.txt configuration
- Canonical URLs
- Alt text for all images

## ♿ Accessibility

- WCAG 2.1 AA compliant
- Keyboard navigation support
- Screen reader friendly
- Focus indicators
- Reduced motion support
- ARIA labels throughout
- Semantic HTML

## 📱 Mobile Optimizations

- Mobile-first design approach
- Touch-optimized interactions
- Simplified animations on mobile
- Gesture support (swipe navigation)
- Optimized tap targets (min 44px)
- Lazy loading for all media
- Responsive images with srcset
- Reduced particle count on mobile

## 🔒 Performance Budget

- **JavaScript Bundle**: < 200KB
- **First Contentful Paint**: < 1.5s
- **Largest Contentful Paint**: < 2.5s
- **Time to Interactive**: < 3s
- **Cumulative Layout Shift**: < 0.1
- **Total Page Weight**: < 1MB

## 🧪 Testing

Run a Lighthouse audit:

```bash
npm run build
npm start
# Open Chrome DevTools > Lighthouse > Run audit
```

## 📝 Content Customization

To customize the content:

1. **Personal Information**: Update `app/layout.tsx` metadata
2. **Hero Section**: Edit `components/sections/HeroSection.tsx`
3. **Career Timeline**: Modify `components/sections/JourneySection.tsx`
4. **Expertise Areas**: Update `components/sections/ExpertiseSection.tsx`
5. **Projects**: Edit `components/sections/FeaturedWorkSection.tsx`
6. **Articles**: Modify `components/sections/ThoughtLeadershipSection.tsx`
7. **Structured Data**: Update `lib/structuredData.ts`

## 🤝 Contributing

This is a personal portfolio project. If you'd like to use it as a template:

1. Fork the repository
2. Customize the content
3. Update the metadata and SEO information
4. Deploy to your preferred hosting platform

## 📄 License

This project is licensed under the ISC License.

## 🙏 Credits

- **Design Inspiration**: Apple, Stripe, Bloomberg Businessweek
- **Fonts**: Google Fonts
- **Icons**: Heroicons
- **Animations**: Framer Motion, GSAP

## 📞 Support

For questions or support, please contact [alexander@example.com](mailto:alexander@example.com).

---

**Built with ❤️ using Next.js 16 and modern web technologies.**
