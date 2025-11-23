import { Metadata } from "next";
import FeaturedWorkSection from "@/components/sections/FeaturedWorkSection";

export const metadata: Metadata = {
  title: "Work | Alexander Chen",
  description: "Explore Alexander Chen's portfolio of transformative ventures and leadership roles.",
};

export default function WorkPage() {
  return (
    <div className="min-h-screen pt-20">
      {/* Hero */}
      <section className="py-20 bg-gradient-to-b from-gray-50 to-white dark:from-luxury-charcoal dark:to-luxury-black">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h1 className="text-5xl md:text-6xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
            My Work
          </h1>
          <p className="text-xl text-gray-600 dark:text-gray-400 leading-relaxed max-w-3xl mx-auto">
            A portfolio of transformative ventures spanning technology, innovation, and
            strategic leadership across multiple industries.
          </p>
        </div>
      </section>

      {/* Featured Work */}
      <FeaturedWorkSection />

      {/* Additional Portfolio Categories */}
      <section className="py-20 bg-gradient-to-b from-gray-50 to-white dark:from-luxury-charcoal dark:to-luxury-black">
        <div className="max-w-7xl mx-auto px-6">
          <h2 className="text-4xl font-serif font-bold mb-12 text-center text-gray-900 dark:text-white">
            Other Engagements
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {/* Board Positions */}
            <div className="glass rounded-xl p-8">
              <h3 className="text-2xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
                Board Positions
              </h3>
              <ul className="space-y-4">
                {[
                  {
                    company: "TechForGood Foundation",
                    role: "Board Member",
                    period: "2020 - Present",
                  },
                  {
                    company: "NextGen AI Labs",
                    role: "Advisory Board",
                    period: "2021 - Present",
                  },
                  {
                    company: "Global Innovation Council",
                    role: "Strategic Advisor",
                    period: "2019 - Present",
                  },
                ].map((position) => (
                  <li
                    key={position.company}
                    className="border-l-2 border-luxury-gold pl-4"
                  >
                    <h4 className="font-semibold text-gray-900 dark:text-white">
                      {position.company}
                    </h4>
                    <p className="text-sm text-luxury-gold">{position.role}</p>
                    <p className="text-xs text-gray-600 dark:text-gray-400">
                      {position.period}
                    </p>
                  </li>
                ))}
              </ul>
            </div>

            {/* Investments */}
            <div className="glass rounded-xl p-8">
              <h3 className="text-2xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
                Select Investments
              </h3>
              <ul className="space-y-4">
                {[
                  {
                    company: "Quantum Computing Ventures",
                    stage: "Series A",
                    focus: "Quantum AI",
                  },
                  {
                    company: "BioTech Innovations Inc",
                    stage: "Series B",
                    focus: "Healthcare AI",
                  },
                  {
                    company: "CleanTech Solutions",
                    stage: "Seed",
                    focus: "Climate Tech",
                  },
                ].map((investment) => (
                  <li
                    key={investment.company}
                    className="border-l-2 border-luxury-silver pl-4"
                  >
                    <h4 className="font-semibold text-gray-900 dark:text-white">
                      {investment.company}
                    </h4>
                    <p className="text-sm text-luxury-gold">{investment.stage}</p>
                    <p className="text-xs text-gray-600 dark:text-gray-400">
                      {investment.focus}
                    </p>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-20 bg-white dark:bg-luxury-black">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-3xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
            Let&apos;s Build Something Great Together
          </h2>
          <p className="text-lg text-gray-600 dark:text-gray-400 mb-8">
            Exploring opportunities for advisory, board positions, or strategic partnerships.
          </p>
          <a
            href="/contact"
            className="inline-flex items-center magnetic-button px-8 py-4 bg-gradient-to-r from-luxury-gold to-luxury-silver text-luxury-black font-semibold rounded-lg shadow-lg hover:shadow-xl transition-all"
          >
            Start a Conversation
            <svg
              className="ml-2 w-5 h-5"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M17 8l4 4m0 0l-4 4m4-4H3"
              />
            </svg>
          </a>
        </div>
      </section>
    </div>
  );
}
