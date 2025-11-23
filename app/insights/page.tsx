import { Metadata } from "next";
import ThoughtLeadershipSection from "@/components/sections/ThoughtLeadershipSection";

export const metadata: Metadata = {
  title: "Insights | Alexander Chen",
  description: "Read Alexander Chen's latest articles, interviews, and perspectives on leadership and innovation.",
};

export default function InsightsPage() {
  return (
    <div className="min-h-screen pt-20">
      {/* Hero */}
      <section className="py-20 bg-gradient-to-b from-gray-50 to-white dark:from-luxury-charcoal dark:to-luxury-black">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h1 className="text-5xl md:text-6xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
            Insights
          </h1>
          <p className="text-xl text-gray-600 dark:text-gray-400 leading-relaxed max-w-3xl mx-auto">
            Perspectives on leadership, innovation, and the future of technology from
            two decades of building and scaling world-class organizations.
          </p>
        </div>
      </section>

      {/* Thought Leadership Content */}
      <ThoughtLeadershipSection />

      {/* Categories */}
      <section className="py-20 bg-white dark:bg-luxury-black">
        <div className="max-w-7xl mx-auto px-6">
          <h2 className="text-4xl font-serif font-bold mb-12 text-center text-gray-900 dark:text-white">
            Topics I Write About
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {[
              {
                title: "Leadership",
                description: "Building high-performing teams and cultures of excellence",
                icon: "👥",
                count: "24 articles",
              },
              {
                title: "Innovation",
                description: "Creating breakthrough products and disruptive business models",
                icon: "💡",
                count: "18 articles",
              },
              {
                title: "Strategy",
                description: "Navigating markets, scaling companies, and winning",
                icon: "🎯",
                count: "32 articles",
              },
              {
                title: "Technology",
                description: "AI, cloud, SaaS, and the future of enterprise tech",
                icon: "🚀",
                count: "21 articles",
              },
              {
                title: "Investment",
                description: "Venture capital, due diligence, and portfolio strategy",
                icon: "💼",
                count: "15 articles",
              },
              {
                title: "Future of Work",
                description: "Remote teams, productivity, and organizational design",
                icon: "🌍",
                count: "19 articles",
              },
            ].map((category) => (
              <div
                key={category.title}
                className="group glass rounded-xl p-6 hover:bg-white/20 dark:hover:bg-black/40 transition-all cursor-pointer"
              >
                <div className="text-5xl mb-4 group-hover:scale-110 transition-transform">
                  {category.icon}
                </div>
                <h3 className="text-xl font-bold mb-2 text-gray-900 dark:text-white group-hover:text-luxury-gold transition-colors">
                  {category.title}
                </h3>
                <p className="text-gray-600 dark:text-gray-400 mb-4 text-sm">
                  {category.description}
                </p>
                <span className="text-xs text-luxury-gold font-semibold">
                  {category.count}
                </span>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Speaking */}
      <section className="py-20 bg-gradient-to-b from-gray-50 to-white dark:from-luxury-charcoal dark:to-luxury-black">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-4xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
            Speaking Engagements
          </h2>
          <p className="text-lg text-gray-600 dark:text-gray-400 mb-8">
            Available for keynotes, panels, and fireside chats on leadership,
            innovation, and the future of technology.
          </p>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
            {[
              "Executive Leadership",
              "Digital Transformation",
              "AI & Machine Learning",
              "Scaling Startups",
              "Building Culture",
              "Strategic Innovation",
            ].map((topic) => (
              <div
                key={topic}
                className="flex items-center space-x-3 glass rounded-lg p-4"
              >
                <svg
                  className="w-5 h-5 text-luxury-gold flex-shrink-0"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fillRule="evenodd"
                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                    clipRule="evenodd"
                  />
                </svg>
                <span className="text-gray-900 dark:text-white font-medium">
                  {topic}
                </span>
              </div>
            ))}
          </div>

          <a
            href="/contact"
            className="inline-flex items-center magnetic-button px-8 py-4 bg-gradient-to-r from-luxury-gold to-luxury-silver text-luxury-black font-semibold rounded-lg shadow-lg hover:shadow-xl transition-all"
          >
            Book a Speaking Engagement
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
