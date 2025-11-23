import type { Metadata } from "next";
import "./globals.css";
import Navigation from "@/components/Navigation";
import CustomCursor from "@/components/CustomCursor";
import { ThemeProvider } from "@/components/ThemeProvider";
import { generateStructuredData } from "@/lib/structuredData";

export const metadata: Metadata = {
  title: "Alexander Chen | CEO & Visionary Leader",
  description: "Personal portfolio of Alexander Chen - Technology CEO, Innovation Leader, and Strategic Advisor with 20+ years of transformative leadership experience.",
  keywords: ["CEO", "Technology Leader", "Innovation", "Executive", "Strategic Advisor"],
  authors: [{ name: "Alexander Chen" }],
  creator: "Alexander Chen",
  publisher: "Alexander Chen",
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://alexanderchen.com",
    siteName: "Alexander Chen",
    title: "Alexander Chen | CEO & Visionary Leader",
    description: "Technology CEO, Innovation Leader, and Strategic Advisor with 20+ years of transformative leadership experience.",
    images: [
      {
        url: "/og-image.jpg",
        width: 1200,
        height: 630,
        alt: "Alexander Chen",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "Alexander Chen | CEO & Visionary Leader",
    description: "Technology CEO, Innovation Leader, and Strategic Advisor",
    images: ["/og-image.jpg"],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  icons: {
    icon: "/favicon.ico",
    shortcut: "/favicon-16x16.png",
    apple: "/apple-touch-icon.png",
  },
  manifest: "/site.webmanifest",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={generateStructuredData()}
        />
      </head>
      <body className="font-sans antialiased">
        <ThemeProvider>
          <CustomCursor />
          <Navigation />
          <main className="min-h-screen">
            {children}
          </main>
        </ThemeProvider>
      </body>
    </html>
  );
}
