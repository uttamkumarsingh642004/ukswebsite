"use client";

import { useState, useEffect } from "react";
import { motion } from "framer-motion";

const expertiseAreas = [
  {
    icon: "🚀",
    title: "Tech & Innovation",
    description: "Leading breakthrough technologies from AI/ML to blockchain, driving digital transformation across industries.",
    tags: ["AI/ML", "Cloud", "SaaS", "Blockchain"],
  },
  {
    icon: "💼",
    title: "Strategic Leadership",
    description: "Building and scaling world-class organizations with proven track record in hypergrowth environments.",
    tags: ["Growth Strategy", "M&A", "Fundraising", "IPO"],
  },
  {
    icon: "🎯",
    title: "Product Excellence",
    description: "Creating category-defining products that solve real problems and delight millions of users globally.",
    tags: ["Product Strategy", "UX/UI", "Go-to-Market", "Analytics"],
  },
  {
    icon: "🌍",
    title: "Global Expansion",
    description: "Expanding businesses across continents, navigating cultural nuances and regulatory landscapes.",
    tags: ["International", "Partnerships", "Market Entry", "Localization"],
  },
  {
    icon: "👥",
    title: "Team Building",
    description: "Attracting, developing, and retaining exceptional talent to build high-performing cultures.",
    tags: ["Hiring", "Culture", "Leadership Dev", "Retention"],
  },
  {
    icon: "💡",
    title: "Innovation Strategy",
    description: "Fostering cultures of innovation, implementing frameworks that turn ideas into market realities.",
    tags: ["R&D", "Innovation Labs", "Ventures", "Ecosystem"],
  },
];

export default function ExpertiseSection() {
  const [isVisible, setIsVisible] = useState(false);
  const [hoveredIndex, setHoveredIndex] = useState<number | null>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.1 }
    );

    const section = document.getElementById("expertise");
    if (section) {
      observer.observe(section);
    }

    return () => observer.disconnect();
  }, []);

  return (
    <section
      id="expertise"
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
            Expertise
          </span>
          <h2 className="mt-4 text-4xl md:text-5xl font-serif font-bold text-gray-900 dark:text-white">
            Domains of
            <span className="block gradient-text">Deep Impact</span>
          </h2>
          <p className="mt-4 text-lg text-gray-600 dark:text-gray-400 max-w-3xl mx-auto">
            Cross-functional expertise honed through decades of hands-on leadership
            in technology, business, and innovation.
          </p>
        </motion.div>

        {/* Expertise Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {expertiseAreas.map((area, index) => (
            <motion.div
              key={area.title}
              initial={{ opacity: 0, y: 30 }}
              animate={isVisible ? { opacity: 1, y: 0 } : {}}
              transition={{ duration: 0.6, delay: index * 0.1 }}
              onMouseEnter={() => setHoveredIndex(index)}
              onMouseLeave={() => setHoveredIndex(null)}
              onTouchStart={() => setHoveredIndex(index)}
              className="group relative"
            >
              <div
                className={`
                  relative h-full p-8 rounded-2xl backdrop-blur-sm
                  border transition-all duration-300
                  ${
                    hoveredIndex === index
                      ? "bg-white dark:bg-luxury-slate border-luxury-gold shadow-2xl scale-105"
                      : "bg-white/50 dark:bg-luxury-slate/50 border-gray-200 dark:border-luxury-charcoal shadow-lg"
                  }
                `}
              >
                {/* Icon */}
                <div
                  className={`
                    text-6xl mb-4 transition-transform duration-300
                    ${hoveredIndex === index ? "scale-110 animate-float" : ""}
                  `}
                >
                  {area.icon}
                </div>

                {/* Title */}
                <h3 className="text-2xl font-bold mb-3 text-gray-900 dark:text-white">
                  {area.title}
                </h3>

                {/* Description */}
                <p className="text-gray-600 dark:text-gray-400 mb-4 leading-relaxed">
                  {area.description}
                </p>

                {/* Tags */}
                <div className="flex flex-wrap gap-2">
                  {area.tags.map((tag) => (
                    <span
                      key={tag}
                      className="px-3 py-1 text-xs font-medium rounded-full bg-luxury-gold/10 text-gray-900 dark:text-gray-300 border border-luxury-gold/20"
                    >
                      {tag}
                    </span>
                  ))}
                </div>

                {/* Hover Effect Border */}
                <div
                  className={`
                    absolute inset-0 rounded-2xl bg-gradient-to-r from-luxury-gold to-luxury-silver opacity-0
                    transition-opacity duration-300 -z-10 blur-xl
                    ${hoveredIndex === index ? "opacity-30" : ""}
                  `}
                />
              </div>
            </motion.div>
          ))}
        </div>

        {/* Call to Action */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={isVisible ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.8, delay: 0.8 }}
          className="mt-16 text-center"
        >
          <p className="text-lg text-gray-600 dark:text-gray-400 mb-6">
            Looking for strategic guidance in any of these areas?
          </p>
          <a
            href="#contact"
            className="inline-flex items-center magnetic-button px-8 py-4 bg-gradient-to-r from-luxury-gold to-luxury-silver text-luxury-black font-semibold rounded-lg shadow-lg hover:shadow-xl transition-all"
          >
            Let&apos;s Talk
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
        </motion.div>
      </div>
    </section>
  );
}
