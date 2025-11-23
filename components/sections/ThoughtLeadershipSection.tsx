"use client";

import { useState, useEffect } from "react";
import { motion } from "framer-motion";

const articles = [
  {
    id: 1,
    title: "The Future of AI Leadership: Beyond the Hype",
    excerpt: "Exploring how next-generation leaders must balance technological innovation with human-centric values in the age of artificial intelligence.",
    publication: "Harvard Business Review",
    date: "March 2024",
    readTime: "8 min read",
    category: "AI & Innovation",
    link: "#",
  },
  {
    id: 2,
    title: "Building Resilient Organizations in Uncertain Times",
    excerpt: "Key strategies for creating adaptive, antifragile companies that thrive in volatility and emerge stronger from disruption.",
    publication: "Forbes",
    date: "February 2024",
    readTime: "6 min read",
    category: "Leadership",
    link: "#",
  },
  {
    id: 3,
    title: "The 10x Mindset: Scaling Beyond Incremental Growth",
    excerpt: "Why transformative leaders think in multiples, not percentages, and how to cultivate exponential thinking in your organization.",
    publication: "TechCrunch",
    date: "January 2024",
    readTime: "10 min read",
    category: "Strategy",
    link: "#",
  },
];

const interviews = [
  {
    title: "Masters of Scale Podcast",
    description: "In conversation with Reid Hoffman about scaling companies from Series A to IPO",
    date: "December 2023",
    type: "Podcast",
    duration: "45 min",
  },
  {
    title: "CNBC Leadership Summit",
    description: "Keynote on the intersection of technology, business, and societal impact",
    date: "November 2023",
    type: "Video",
    duration: "30 min",
  },
  {
    title: "The Tim Ferriss Show",
    description: "Deep dive into decision-making frameworks and leadership philosophy",
    date: "October 2023",
    type: "Podcast",
    duration: "2 hr",
  },
];

export default function ThoughtLeadershipSection() {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.1 }
    );

    const section = document.getElementById("insights");
    if (section) {
      observer.observe(section);
    }

    return () => observer.disconnect();
  }, []);

  return (
    <section
      id="insights"
      className="relative py-20 bg-gradient-to-b from-gray-50 to-white dark:from-luxury-charcoal dark:to-luxury-black"
    >
      <div className="max-w-7xl mx-auto px-6">
        {/* Section Header */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={isVisible ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.6 }}
          className="mb-16 text-center"
        >
          <span className="text-luxury-gold text-sm font-semibold tracking-widest uppercase">
            Insights & Ideas
          </span>
          <h2 className="mt-4 text-4xl md:text-5xl font-serif font-bold text-gray-900 dark:text-white">
            Thought
            <span className="block gradient-text">Leadership</span>
          </h2>
          <p className="mt-4 text-lg text-gray-600 dark:text-gray-400 max-w-3xl mx-auto">
            Sharing perspectives on leadership, innovation, and the future of business
            through writing, speaking, and conversations.
          </p>
        </motion.div>

        {/* Recent Articles */}
        <div className="mb-16">
          <h3 className="text-2xl font-serif font-bold mb-8 text-gray-900 dark:text-white">
            Recent Articles
          </h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {articles.map((article, index) => (
              <motion.a
                key={article.id}
                href={article.link}
                initial={{ opacity: 0, y: 30 }}
                animate={isVisible ? { opacity: 1, y: 0 } : {}}
                transition={{ duration: 0.6, delay: index * 0.1 }}
                className="group relative block"
              >
                <div className="h-full p-6 rounded-xl bg-white dark:bg-luxury-slate border border-gray-200 dark:border-luxury-charcoal hover:border-luxury-gold dark:hover:border-luxury-gold transition-all hover:shadow-xl">
                  {/* Category Badge */}
                  <div className="inline-flex items-center px-3 py-1 rounded-full bg-luxury-gold/10 border border-luxury-gold/20 mb-4">
                    <span className="text-xs font-semibold text-luxury-gold uppercase">
                      {article.category}
                    </span>
                  </div>

                  {/* Title */}
                  <h4 className="text-xl font-bold mb-3 text-gray-900 dark:text-white group-hover:text-luxury-gold transition-colors">
                    {article.title}
                  </h4>

                  {/* Excerpt */}
                  <p className="text-gray-600 dark:text-gray-400 mb-4 leading-relaxed line-clamp-3">
                    {article.excerpt}
                  </p>

                  {/* Meta Info */}
                  <div className="flex items-center justify-between text-sm text-gray-500 dark:text-gray-500 pt-4 border-t border-gray-200 dark:border-luxury-charcoal">
                    <div>
                      <p className="font-semibold text-gray-700 dark:text-gray-300">
                        {article.publication}
                      </p>
                      <p>{article.date}</p>
                    </div>
                    <span className="text-xs">{article.readTime}</span>
                  </div>

                  {/* Read More Arrow */}
                  <div className="absolute bottom-6 right-6 text-luxury-gold opacity-0 group-hover:opacity-100 transform translate-x-0 group-hover:translate-x-2 transition-all">
                    <svg
                      className="w-6 h-6"
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
                  </div>
                </div>
              </motion.a>
            ))}
          </div>
        </div>

        {/* Interviews & Speaking */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={isVisible ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.8, delay: 0.4 }}
        >
          <h3 className="text-2xl font-serif font-bold mb-8 text-gray-900 dark:text-white">
            Interviews & Speaking
          </h3>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {interviews.map((interview, index) => (
              <div
                key={interview.title}
                className="p-6 rounded-xl glass hover:bg-white/20 dark:hover:bg-black/40 transition-all group cursor-pointer"
              >
                {/* Type Badge */}
                <div className="flex items-center justify-between mb-4">
                  <span className="px-3 py-1 rounded-full bg-luxury-silver/20 text-xs font-semibold text-gray-700 dark:text-gray-300 uppercase">
                    {interview.type}
                  </span>
                  <span className="text-xs text-gray-600 dark:text-gray-400">
                    {interview.duration}
                  </span>
                </div>

                {/* Title */}
                <h4 className="text-lg font-bold mb-2 text-gray-900 dark:text-white group-hover:text-luxury-gold transition-colors">
                  {interview.title}
                </h4>

                {/* Description */}
                <p className="text-sm text-gray-600 dark:text-gray-400 mb-4">
                  {interview.description}
                </p>

                {/* Date */}
                <p className="text-xs text-gray-500 dark:text-gray-500">
                  {interview.date}
                </p>

                {/* Play/Watch Icon */}
                <div className="mt-4 flex items-center text-luxury-gold group-hover:translate-x-2 transition-transform">
                  <svg
                    className="w-5 h-5 mr-2"
                    fill="currentColor"
                    viewBox="0 0 20 20"
                  >
                    <path d="M6.3 2.841A1.5 1.5 0 004 4.11V15.89a1.5 1.5 0 002.3 1.269l9.344-5.89a1.5 1.5 0 000-2.538L6.3 2.84z" />
                  </svg>
                  <span className="text-sm font-semibold">
                    {interview.type === "Podcast" ? "Listen" : "Watch"}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </motion.div>

        {/* Newsletter CTA */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={isVisible ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.8, delay: 0.6 }}
          className="mt-16 glass rounded-2xl p-8 md:p-12 text-center"
        >
          <h3 className="text-2xl md:text-3xl font-serif font-bold mb-4 text-gray-900 dark:text-white">
            Stay Updated
          </h3>
          <p className="text-gray-600 dark:text-gray-400 mb-6 max-w-2xl mx-auto">
            Receive monthly insights on leadership, innovation, and the future of technology.
            No spam, just valuable perspectives.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 max-w-md mx-auto">
            <input
              type="email"
              placeholder="Enter your email"
              className="flex-1 px-4 py-3 rounded-lg bg-white dark:bg-luxury-charcoal border border-gray-300 dark:border-luxury-slate focus:border-luxury-gold focus:outline-none focus:ring-2 focus:ring-luxury-gold/20 text-gray-900 dark:text-white"
            />
            <button className="magnetic-button px-6 py-3 bg-gradient-to-r from-luxury-gold to-luxury-silver text-luxury-black font-semibold rounded-lg hover:shadow-lg transition-all">
              Subscribe
            </button>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
