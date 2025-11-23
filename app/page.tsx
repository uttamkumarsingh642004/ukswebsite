import dynamic from "next/dynamic";
import HeroSection from "@/components/sections/HeroSection";

// Dynamically import sections for better code splitting
const PhilosophySection = dynamic(() => import("@/components/sections/PhilosophySection"), {
  loading: () => <div className="h-screen" />,
});

const JourneySection = dynamic(() => import("@/components/sections/JourneySection"), {
  loading: () => <div className="h-screen" />,
});

const ExpertiseSection = dynamic(() => import("@/components/sections/ExpertiseSection"), {
  loading: () => <div className="h-screen" />,
});

const FeaturedWorkSection = dynamic(() => import("@/components/sections/FeaturedWorkSection"), {
  loading: () => <div className="h-screen" />,
});

const ThoughtLeadershipSection = dynamic(() => import("@/components/sections/ThoughtLeadershipSection"), {
  loading: () => <div className="h-screen" />,
});

const ContactSection = dynamic(() => import("@/components/sections/ContactSection"), {
  loading: () => <div className="h-screen" />,
});

export default function Home() {
  return (
    <>
      <HeroSection />
      <PhilosophySection />
      <JourneySection />
      <ExpertiseSection />
      <FeaturedWorkSection />
      <ThoughtLeadershipSection />
      <ContactSection />

      {/* Footer */}
      <footer className="bg-luxury-black text-white py-12">
        <div className="max-w-7xl mx-auto px-6">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
            <div className="col-span-2">
              <div className="flex items-center space-x-2 mb-4">
                <div className="w-10 h-10 bg-gradient-to-br from-luxury-gold to-luxury-silver rounded-lg flex items-center justify-center">
                  <span className="text-luxury-black font-bold text-xl">AC</span>
                </div>
                <span className="font-serif text-xl font-bold gradient-text">
                  Alexander Chen
                </span>
              </div>
              <p className="text-gray-400 max-w-md">
                Visionary CEO and strategic advisor helping organizations navigate the
                future of technology and innovation.
              </p>
            </div>

            <div>
              <h3 className="font-semibold mb-4 text-luxury-gold">Quick Links</h3>
              <ul className="space-y-2">
                <li>
                  <a href="#journey" className="text-gray-400 hover:text-luxury-gold transition-colors">
                    Journey
                  </a>
                </li>
                <li>
                  <a href="#expertise" className="text-gray-400 hover:text-luxury-gold transition-colors">
                    Expertise
                  </a>
                </li>
                <li>
                  <a href="#work" className="text-gray-400 hover:text-luxury-gold transition-colors">
                    Work
                  </a>
                </li>
                <li>
                  <a href="#insights" className="text-gray-400 hover:text-luxury-gold transition-colors">
                    Insights
                  </a>
                </li>
              </ul>
            </div>

            <div>
              <h3 className="font-semibold mb-4 text-luxury-gold">Connect</h3>
              <ul className="space-y-2">
                <li>
                  <a href="#contact" className="text-gray-400 hover:text-luxury-gold transition-colors">
                    Contact
                  </a>
                </li>
                <li>
                  <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-luxury-gold transition-colors">
                    LinkedIn
                  </a>
                </li>
                <li>
                  <a href="https://twitter.com" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-luxury-gold transition-colors">
                    Twitter
                  </a>
                </li>
              </ul>
            </div>
          </div>

          <div className="border-t border-luxury-slate pt-8">
            <div className="flex flex-col md:flex-row justify-between items-center">
              <p className="text-gray-400 text-sm">
                © {new Date().getFullYear()} Alexander Chen. All rights reserved.
              </p>
              <div className="flex space-x-6 mt-4 md:mt-0">
                <a href="/privacy" className="text-gray-400 hover:text-luxury-gold text-sm transition-colors">
                  Privacy Policy
                </a>
                <a href="/terms" className="text-gray-400 hover:text-luxury-gold text-sm transition-colors">
                  Terms of Service
                </a>
              </div>
            </div>
          </div>
        </div>
      </footer>
    </>
  );
}
