"use client";

import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";

const featuredProjects = [
  {
    id: 1,
    title: "Infinity Technologies",
    category: "Current Leadership",
    role: "CEO & Board Member",
    period: "2019 - Present",
    description: "Leading a revolutionary AI-powered SaaS platform that's transforming how enterprises manage their operations. Scaled from $50M to $300M ARR.",
    impact: [
      "300M+ ARR achieved",
      "500+ enterprise clients",
      "85% YoY growth rate",
      "Series D funded",
    ],
    color: "from-blue-500 to-purple-500",
    image: "/images/work-1.jpg",
  },
  {
    id: 2,
    title: "NexGen Solutions",
    category: "Successful Exit",
    role: "Chief Executive Officer",
    period: "2012 - 2016",
    description: "Orchestrated complete business transformation of struggling tech firm, resulting in 4x revenue growth and strategic acquisition by industry leader.",
    impact: [
      "$120M acquisition",
      "4x revenue growth",
      "200+ jobs preserved",
      "Market leader position",
    ],
    color: "from-green-500 to-teal-500",
    image: "/images/work-2.jpg",
  },
  {
    id: 3,
    title: "Apex Ventures Portfolio",
    category: "Venture Capital",
    role: "Operating Partner",
    period: "2016 - 2019",
    description: "Advised 15+ high-growth startups through critical scaling phases, contributing to 8 successful exits totaling $2B+ in value creation.",
    impact: [
      "15+ companies advised",
      "8 successful exits",
      "$2B+ value created",
      "3 unicorns produced",
    ],
    color: "from-orange-500 to-red-500",
    image: "/images/work-3.jpg",
  },
  {
    id: 4,
    title: "Global Innovations Corp",
    category: "Corporate Leadership",
    role: "VP of Product",
    period: "2008 - 2012",
    description: "Led product strategy for Fortune 500 company, launching 3 category-defining products that generated $500M+ in annual revenue.",
    impact: [
      "$500M+ revenue",
      "3 major product launches",
      "50M+ users reached",
      "Industry awards won",
    ],
    color: "from-pink-500 to-purple-500",
    image: "/images/work-4.jpg",
  },
];

export default function FeaturedWorkSection() {
  const [isVisible, setIsVisible] = useState(false);
  const [selectedProject, setSelectedProject] = useState<number | null>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.1 }
    );

    const section = document.getElementById("work");
    if (section) {
      observer.observe(section);
    }

    return () => observer.disconnect();
  }, []);

  return (
    <section
      id="work"
      className="relative py-20 bg-white dark:bg-luxury-black overflow-hidden"
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
            Featured Work
          </span>
          <h2 className="mt-4 text-4xl md:text-5xl font-serif font-bold text-gray-900 dark:text-white">
            Transformative
            <span className="block gradient-text">Impact at Scale</span>
          </h2>
          <p className="mt-4 text-lg text-gray-600 dark:text-gray-400 max-w-3xl mx-auto">
            A selection of ventures where vision met execution, creating lasting value
            and redefining industry standards.
          </p>
        </motion.div>

        {/* Projects Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {featuredProjects.map((project, index) => (
            <motion.div
              key={project.id}
              initial={{ opacity: 0, y: 30 }}
              animate={isVisible ? { opacity: 1, y: 0 } : {}}
              transition={{ duration: 0.6, delay: index * 0.1 }}
              onClick={() => setSelectedProject(project.id)}
              className="group relative cursor-pointer"
            >
              <div className="relative h-full rounded-2xl overflow-hidden bg-gradient-to-br from-gray-100 to-gray-200 dark:from-luxury-slate dark:to-luxury-charcoal">
                {/* Gradient Overlay */}
                <div
                  className={`absolute inset-0 bg-gradient-to-br ${project.color} opacity-10 group-hover:opacity-20 transition-opacity`}
                />

                {/* Content */}
                <div className="relative p-8">
                  {/* Category Badge */}
                  <div className="inline-flex items-center px-3 py-1 rounded-full bg-luxury-gold/20 border border-luxury-gold/30 mb-4">
                    <span className="text-xs font-semibold text-luxury-gold uppercase tracking-wide">
                      {project.category}
                    </span>
                  </div>

                  {/* Title & Role */}
                  <h3 className="text-3xl font-serif font-bold mb-2 text-gray-900 dark:text-white group-hover:gradient-text transition-all">
                    {project.title}
                  </h3>
                  <p className="text-luxury-gold font-semibold mb-1">
                    {project.role}
                  </p>
                  <p className="text-sm text-gray-600 dark:text-gray-400 mb-4">
                    {project.period}
                  </p>

                  {/* Description */}
                  <p className="text-gray-700 dark:text-gray-300 mb-6 leading-relaxed">
                    {project.description}
                  </p>

                  {/* Impact Metrics */}
                  <div className="grid grid-cols-2 gap-3 mb-6">
                    {project.impact.map((metric) => (
                      <div
                        key={metric}
                        className="flex items-start space-x-2"
                      >
                        <svg
                          className="w-5 h-5 text-luxury-gold flex-shrink-0 mt-0.5"
                          fill="currentColor"
                          viewBox="0 0 20 20"
                        >
                          <path
                            fillRule="evenodd"
                            d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                            clipRule="evenodd"
                          />
                        </svg>
                        <span className="text-sm text-gray-700 dark:text-gray-300">
                          {metric}
                        </span>
                      </div>
                    ))}
                  </div>

                  {/* Learn More Link */}
                  <div className="flex items-center text-luxury-gold font-semibold group-hover:translate-x-2 transition-transform">
                    <span>Learn More</span>
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
                  </div>
                </div>

                {/* Hover Effect */}
                <div className="absolute inset-0 border-2 border-luxury-gold opacity-0 group-hover:opacity-100 rounded-2xl transition-opacity pointer-events-none" />
              </div>
            </motion.div>
          ))}
        </div>

        {/* Overall Impact Stats */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={isVisible ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.8, delay: 0.6 }}
          className="mt-20 glass rounded-2xl p-8 md:p-12"
        >
          <h3 className="text-2xl md:text-3xl font-serif font-bold text-center mb-8 text-gray-900 dark:text-white">
            Cumulative Impact Across All Ventures
          </h3>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {[
              { value: "$5B+", label: "Total Value Created" },
              { value: "100K+", label: "Jobs Created/Saved" },
              { value: "100M+", label: "Lives Impacted" },
              { value: "25+", label: "Countries Reached" },
            ].map((stat) => (
              <div key={stat.label} className="text-center">
                <div className="text-3xl md:text-4xl font-bold gradient-text mb-2">
                  {stat.value}
                </div>
                <div className="text-sm text-gray-600 dark:text-gray-400">
                  {stat.label}
                </div>
              </div>
            ))}
          </div>
        </motion.div>
      </div>

      {/* Modal for detailed view (optional - can be expanded) */}
      <AnimatePresence>
        {selectedProject && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={() => setSelectedProject(null)}
            className="fixed inset-0 bg-black/80 z-50 flex items-center justify-center p-6"
          >
            <motion.div
              initial={{ scale: 0.9, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.9, opacity: 0 }}
              onClick={(e) => e.stopPropagation()}
              className="bg-white dark:bg-luxury-slate rounded-2xl p-8 max-w-2xl w-full max-h-[90vh] overflow-y-auto"
            >
              <div className="flex justify-between items-start mb-6">
                <h3 className="text-3xl font-serif font-bold text-gray-900 dark:text-white">
                  {featuredProjects.find((p) => p.id === selectedProject)?.title}
                </h3>
                <button
                  onClick={() => setSelectedProject(null)}
                  className="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
              <p className="text-gray-700 dark:text-gray-300">
                Detailed case study coming soon...
              </p>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </section>
  );
}
