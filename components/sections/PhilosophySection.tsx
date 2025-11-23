"use client";

import { useEffect, useRef, useState } from "react";
import { motion, useScroll, useTransform } from "framer-motion";

export default function PhilosophySection() {
  const sectionRef = useRef<HTMLElement>(null);
  const [isVisible, setIsVisible] = useState(false);

  const { scrollYProgress } = useScroll({
    target: sectionRef,
    offset: ["start end", "end start"],
  });

  const y = useTransform(scrollYProgress, [0, 1], [100, -100]);
  const opacity = useTransform(scrollYProgress, [0, 0.3, 0.7, 1], [0, 1, 1, 0]);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.2 }
    );

    if (sectionRef.current) {
      observer.observe(sectionRef.current);
    }

    return () => observer.disconnect();
  }, []);

  return (
    <section
      ref={sectionRef}
      className="relative min-h-screen flex items-center justify-center py-20 overflow-hidden"
    >
      {/* Background gradient */}
      <div className="absolute inset-0 bg-gradient-to-b from-transparent via-luxury-charcoal/20 to-transparent dark:via-luxury-charcoal/40" />

      <div className="relative z-10 max-w-6xl mx-auto px-6">
        <motion.div
          style={{ y, opacity }}
          className="text-center"
        >
          {/* Section Label */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={isVisible ? { opacity: 1, y: 0 } : {}}
            transition={{ duration: 0.6 }}
            className="mb-8"
          >
            <span className="text-luxury-gold text-sm font-semibold tracking-widest uppercase">
              Philosophy
            </span>
          </motion.div>

          {/* Main Quote */}
          <motion.blockquote
            initial={{ opacity: 0, y: 30 }}
            animate={isVisible ? { opacity: 1, y: 0 } : {}}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="relative"
          >
            <svg
              className="absolute -top-8 -left-4 w-16 h-16 text-luxury-gold/20 dark:text-luxury-gold/10"
              fill="currentColor"
              viewBox="0 0 32 32"
              aria-hidden="true"
            >
              <path d="M9.352 4C4.456 7.456 1 13.12 1 19.36c0 5.088 3.072 8.064 6.624 8.064 3.36 0 5.856-2.688 5.856-5.856 0-3.168-2.208-5.472-5.088-5.472-.576 0-1.344.096-1.536.192.48-3.264 3.552-7.104 6.624-9.024L9.352 4zm16.512 0c-4.8 3.456-8.256 9.12-8.256 15.36 0 5.088 3.072 8.064 6.624 8.064 3.264 0 5.856-2.688 5.856-5.856 0-3.168-2.304-5.472-5.184-5.472-.576 0-1.248.096-1.44.192.48-3.264 3.456-7.104 6.528-9.024L25.864 4z" />
            </svg>

            <p className="font-serif text-3xl md:text-5xl lg:text-6xl font-light leading-tight text-gray-900 dark:text-white mb-8">
              Innovation is not about predicting the future,
              <span className="block mt-4 gradient-text">
                it&apos;s about creating it
              </span>
            </p>

            <svg
              className="absolute -bottom-8 -right-4 w-16 h-16 text-luxury-gold/20 dark:text-luxury-gold/10 rotate-180"
              fill="currentColor"
              viewBox="0 0 32 32"
              aria-hidden="true"
            >
              <path d="M9.352 4C4.456 7.456 1 13.12 1 19.36c0 5.088 3.072 8.064 6.624 8.064 3.36 0 5.856-2.688 5.856-5.856 0-3.168-2.208-5.472-5.088-5.472-.576 0-1.344.096-1.536.192.48-3.264 3.552-7.104 6.624-9.024L9.352 4zm16.512 0c-4.8 3.456-8.256 9.12-8.256 15.36 0 5.088 3.072 8.064 6.624 8.064 3.264 0 5.856-2.688 5.856-5.856 0-3.168-2.304-5.472-5.184-5.472-.576 0-1.248.096-1.44.192.48-3.264 3.456-7.104 6.528-9.024L25.864 4z" />
            </svg>
          </motion.blockquote>

          {/* Supporting Text */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={isVisible ? { opacity: 1, y: 0 } : {}}
            transition={{ duration: 0.8, delay: 0.4 }}
            className="mt-16 max-w-4xl mx-auto"
          >
            <p className="text-lg md:text-xl text-gray-600 dark:text-gray-400 leading-relaxed">
              My approach to leadership is grounded in the belief that transformative
              change emerges at the intersection of bold vision, disciplined execution,
              and unwavering commitment to excellence. Every challenge is an opportunity
              to redefine what&apos;s possible.
            </p>
          </motion.div>

          {/* Core Values */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={isVisible ? { opacity: 1, y: 0 } : {}}
            transition={{ duration: 0.8, delay: 0.6 }}
            className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8"
          >
            {[
              {
                title: "Vision",
                description: "Seeing beyond the horizon to identify opportunities that others miss",
              },
              {
                title: "Execution",
                description: "Transforming ambitious ideas into measurable, sustainable impact",
              },
              {
                title: "Excellence",
                description: "Pursuing the highest standards in everything we do",
              },
            ].map((value, index) => (
              <div
                key={value.title}
                className="glass rounded-xl p-6 hover:bg-white/20 dark:hover:bg-black/40 transition-all"
              >
                <div className="text-luxury-gold text-4xl font-serif mb-3">
                  {String(index + 1).padStart(2, "0")}
                </div>
                <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
                  {value.title}
                </h3>
                <p className="text-gray-600 dark:text-gray-400">
                  {value.description}
                </p>
              </div>
            ))}
          </motion.div>
        </motion.div>
      </div>
    </section>
  );
}
