"use client";

import { useEffect, useRef, useState } from "react";
import { motion } from "framer-motion";

const milestones = [
  {
    year: "2004",
    title: "The Beginning",
    company: "TechVentures Inc.",
    role: "Founding Team Member",
    description: "Joined a pioneering startup that would later become a billion-dollar enterprise, shaping my understanding of scalable innovation.",
    achievement: "Helped grow from 5 to 200+ employees",
  },
  {
    year: "2008",
    title: "Leadership Ascent",
    company: "Global Innovations Corp",
    role: "VP of Product",
    description: "Led product strategy for a Fortune 500 company, overseeing a portfolio generating $500M+ in annual revenue.",
    achievement: "Launched 3 category-defining products",
  },
  {
    year: "2012",
    title: "First CEO Role",
    company: "NexGen Solutions",
    role: "Chief Executive Officer",
    description: "Appointed CEO of a struggling tech firm. Led complete transformation resulting in successful acquisition.",
    achievement: "4x revenue growth in 3 years",
  },
  {
    year: "2016",
    title: "Venture Capital",
    company: "Apex Ventures",
    role: "Operating Partner",
    description: "Joined premier VC firm to guide portfolio companies through hypergrowth phases and strategic pivots.",
    achievement: "Advised 15+ startups, 8 successful exits",
  },
  {
    year: "2019",
    title: "Return to Operations",
    company: "Infinity Technologies",
    role: "CEO & Board Member",
    description: "Took the helm of a fast-growing SaaS company, scaling from Series B to pre-IPO stage.",
    achievement: "$50M to $300M ARR in 4 years",
  },
  {
    year: "2024",
    title: "Current Focus",
    company: "Multiple Ventures",
    role: "CEO, Advisor & Investor",
    description: "Leading a revolutionary AI company while advising select startups and serving on prestigious boards.",
    achievement: "Building the next generation of tech leaders",
  },
];

export default function JourneySection() {
  const scrollContainerRef = useRef<HTMLDivElement>(null);
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

    const section = document.getElementById("journey");
    if (section) {
      observer.observe(section);
    }

    return () => observer.disconnect();
  }, []);

  return (
    <section id="journey" className="relative py-20 bg-white dark:bg-luxury-black overflow-hidden">
      <div className="max-w-7xl mx-auto px-6">
        {/* Section Header */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={isVisible ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.6 }}
          className="mb-16 text-center"
        >
          <span className="text-luxury-gold text-sm font-semibold tracking-widest uppercase">
            My Journey
          </span>
          <h2 className="mt-4 text-4xl md:text-5xl font-serif font-bold text-gray-900 dark:text-white">
            Two Decades of
            <span className="block gradient-text">Transformative Leadership</span>
          </h2>
        </motion.div>

        {/* Timeline - Horizontal Scroll */}
        <div className="relative">
          {/* Scroll hint for mobile */}
          <div className="md:hidden text-center mb-4 text-sm text-gray-500 dark:text-gray-400">
            ← Scroll to explore →
          </div>

          <div
            ref={scrollContainerRef}
            className="overflow-x-auto scrollbar-hide pb-8"
            style={{
              scrollSnapType: "x mandatory",
              WebkitOverflowScrolling: "touch",
            }}
          >
            <div className="flex gap-8 min-w-max px-4">
              {milestones.map((milestone, index) => (
                <motion.div
                  key={milestone.year}
                  initial={{ opacity: 0, x: 50 }}
                  animate={isVisible ? { opacity: 1, x: 0 } : {}}
                  transition={{ duration: 0.6, delay: index * 0.1 }}
                  className="relative flex-shrink-0 w-80 scroll-snap-align-start"
                >
                  {/* Timeline line connector */}
                  {index < milestones.length - 1 && (
                    <div className="absolute top-16 left-full w-8 h-0.5 bg-gradient-to-r from-luxury-gold to-luxury-silver hidden md:block" />
                  )}

                  {/* Card */}
                  <div className="glass rounded-xl p-6 h-full hover:bg-white/20 dark:hover:bg-black/40 transition-all group">
                    {/* Year Badge */}
                    <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-gradient-to-br from-luxury-gold to-luxury-silver mb-4 group-hover:scale-110 transition-transform">
                      <span className="text-luxury-black font-bold text-lg">
                        {milestone.year}
                      </span>
                    </div>

                    {/* Content */}
                    <h3 className="text-2xl font-serif font-bold mb-2 text-gray-900 dark:text-white">
                      {milestone.title}
                    </h3>

                    <div className="mb-4">
                      <p className="text-luxury-gold font-semibold">
                        {milestone.company}
                      </p>
                      <p className="text-sm text-gray-600 dark:text-gray-400">
                        {milestone.role}
                      </p>
                    </div>

                    <p className="text-gray-700 dark:text-gray-300 mb-4 leading-relaxed">
                      {milestone.description}
                    </p>

                    {/* Achievement Badge */}
                    <div className="inline-flex items-center px-3 py-1 rounded-full bg-luxury-gold/10 border border-luxury-gold/20">
                      <svg
                        className="w-4 h-4 mr-2 text-luxury-gold"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                      >
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                      </svg>
                      <span className="text-xs font-medium text-gray-900 dark:text-white">
                        {milestone.achievement}
                      </span>
                    </div>
                  </div>
                </motion.div>
              ))}
            </div>
          </div>
        </div>

        {/* Stats Summary */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={isVisible ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.8, delay: 0.6 }}
          className="mt-16 grid grid-cols-2 md:grid-cols-4 gap-8"
        >
          {[
            { number: "20+", label: "Years Experience" },
            { number: "8", label: "Companies Led" },
            { number: "$2B+", label: "Value Created" },
            { number: "50+", label: "Startups Advised" },
          ].map((stat, index) => (
            <div key={stat.label} className="text-center">
              <div className="text-4xl md:text-5xl font-bold gradient-text mb-2">
                {stat.number}
              </div>
              <div className="text-sm text-gray-600 dark:text-gray-400 uppercase tracking-wide">
                {stat.label}
              </div>
            </div>
          ))}
        </motion.div>
      </div>

      <style jsx>{`
        .scrollbar-hide::-webkit-scrollbar {
          display: none;
        }
        .scrollbar-hide {
          -ms-overflow-style: none;
          scrollbar-width: none;
        }
        .scroll-snap-align-start {
          scroll-snap-align: start;
        }
      `}</style>
    </section>
  );
}
